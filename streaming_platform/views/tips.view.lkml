view: tips {
  sql_table_name: `ant-billet-looker-core-argolis.streaming_platform.tips_2` ;;
  drill_fields: [tip_id, tip_time, creators.username, users.user_id, menu_item, tokens]

  dimension: tip_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.tip_id ;;
  }

  dimension: session_id {
    type: number
    hidden: yes
    sql: ${TABLE}.session_id ;;
  }

  dimension: user_id {
    type: number
    hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  dimension: menu_item {
    type: string
    sql: ${TABLE}.menu_item ;;
  }

  dimension_group: tip {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, hour_of_day, day_of_week]
    sql: ${TABLE}.tip_time ;;
  }

  dimension: tokens {
    type: number
    sql: ${TABLE}.tokens ;;
  }

  # --- Measures ---
  measure: count_tips {
    type: count
    # type: count_distinct
    # sql: ${tip_id} ;;
  }

  measure: total_tokens {
    type: sum
    sql: ${tokens} ;;
  }

  measure: median_price {
    type: median
    sql: ${tokens} ;;
  }

  measure: tips_per_broadcast {
    type: number
    value_format_name: decimal_1
    sql: 1.0*${count_tips}/NULLIF(${broadcasts.count_broadcasts},0) ;;
    drill_fields: [count_tips,broadcasts.count_broadcasts]
  }

  # Completes the funnel
  measure: funnel_4_tipped {
    view_label: "Sessions"
    group_label: "Funnel"
    group_item_label: "4) Tipped"
    label: "Tipped"
    type: count_distinct
    sql: ${user_id} ;;
  }

  dimension: price_tier {
    type: string
    sql: CASE
          WHEN ${tokens} <= 50 THEN ' Small tips (≤50)'
          WHEN ${tokens} <= 200 THEN '  Mid-range (51-200)'
          ELSE '  Big tips (200+)'
         END ;;
  }

  measure: tokens_per_viewer {
    type: number
    value_format_name: decimal_2
    sql: 1.0 * ${total_tokens} / NULLIF(${sessions.count_unique_viewers}, 0) ;;
  }

  measure: score_crowd_pleaser {
    view_label: "Z) Creator Score Calcs"
    type: number
    description: "High reach, broad appeal."
    sql:
    -- Viewers component
    (CASE WHEN ${sessions.count_unique_viewers} > 500 THEN 3.0
          WHEN ${sessions.count_unique_viewers} > 200 THEN 2.0
          ELSE 0.5 END) +

    -- Recommendation Index component (Assuming rec_idx is calculated elsewhere)
    --(CASE WHEN rec_idx > 100 THEN 2.0
     --     WHEN rec_idx > 80 THEN 1.0
     --     ELSE 0.0 END) +

    -- Entry funnel component[cite: 4]
    (CASE WHEN ${sessions.funnel_1_room_entries} > 1000 THEN 1.5
          WHEN ${sessions.funnel_1_room_entries} > 400 THEN 1.0
          ELSE 0.0 END) +

    -- Monetization component
    (CASE WHEN ${tokens_per_viewer} < 30 THEN 1.0
          ELSE 0.0 END) ;;
  }

   measure: score_hidden_gem {
    view_label: "Z) Creator Score Calcs"
    type: number
    description: "The Hidden Gem: Great retention + spend, poor discovery"
    sql:
     -- Bounce delta component (requires platform average comparison)
    -- (CASE WHEN bounce_delta < -3 THEN 3.0
    --      WHEN bounce_delta < -2 THEN 1.5
    --       ELSE 0.0 END) +

    -- Long stay retention component (requires platform average comparison)
   -- (CASE WHEN long_stay_pct > long_stay_avg + 5 THEN 2.5
     --     WHEN long_stay_pct > long_stay_avg + 2 THEN 1.0
       --   ELSE 0.0 END) +

    -- Discovery / Recommendation Index component
    --(CASE WHEN rec_idx} < 60 THEN 3.0
      --    WHEN rec_idx} < 75 THEN 1.5
        --  ELSE 0.0 END) +

    -- Monetization component
    (CASE WHEN ${tokens_per_viewer} > 50 THEN 1.5
          WHEN ${tokens_per_viewer} > 20 THEN 0.5
          ELSE 0.0 END) ;;
    value_format_name: decimal_1
  }

  measure: score_whale_whisperer {
    view_label: "Z) Creator Score Calcs"
    type: number
    description: "The Whale Whisperer: Few visitors, but they spend big."
    sql:
    -- Tokens per viewer component
    (CASE WHEN ${tokens_per_viewer} > 100 THEN 3.5
          WHEN ${tokens_per_viewer} > 60 THEN 2.5
          WHEN ${tokens_per_viewer} > 30 THEN 1.5
          WHEN ${tokens_per_viewer} > 10 THEN 1.0
          ELSE 0.0 END) +

    -- Viewers component
    (CASE WHEN ${sessions.count_unique_viewers} < 150 THEN 1.5
          WHEN ${sessions.count_unique_viewers} < 300 THEN 0.5
          ELSE 0.0 END) +

    -- Tip rate component
    (CASE WHEN ${sessions.tip_rate} > 5 THEN 2.0
          WHEN ${sessions.tip_rate} > 2 THEN 1.0
          ELSE 0.0 END) +

    -- Watch-to-tip conversion component
    (CASE WHEN ${sessions.watch_to_tip_rate} > 8 THEN 1.0
          ELSE 0.0 END) ;;
    value_format_name: decimal_1
  }

  measure: max_archetype_score {
    view_label: "Z) Creator Score Calcs"
    type: number
    hidden: yes
    sql: GREATEST(${score_hidden_gem}, ${score_crowd_pleaser}, ${score_whale_whisperer}, ...) ;;
  }

  measure: creator_archetype {
    view_label: "Z) Creator Score Calcs"
    type: string
    label: "Creator Archetype"
    sql: CASE
        WHEN ${max_archetype_score} = ${score_hidden_gem} THEN 'The Hidden Gem'
        WHEN ${max_archetype_score} = ${score_crowd_pleaser} THEN 'The Crowd Pleaser'
        WHEN ${max_archetype_score} = ${score_whale_whisperer} THEN 'The Whale Whisperer'
        ELSE 'The Hidden Gem'
       END ;;
  }

  measure: archetype_summary_card {
    view_label: "Z) Creator Score Calcs"
    type: string
    sql: ${creator_archetype} ;;
    html:
    {% assign color = "#000" %}
    {% if value == 'The Hidden Gem' %}{% assign color = "#1abc9c" %}{% endif %}
    {% if value == 'The Crowd Pleaser' %}{% assign color = "#8e44ad" %}{% endif %}

    <div style="background:#f9f9f9; border-radius:10px; padding:24px 28px; border-left:4px solid {{ color }}; font-family:sans-serif;">
        <div style="display:flex; align-items:center; gap:14px; margin-bottom:10px;">
           <span style="display:inline-block; background:{{ color }}; color:#fff; font-size:11px; font-weight:600; border-radius:4px; padding:5px 12px; letter-spacing:0.4px;">
             {{ value }}
           </span>
        </div>
        <div style="font-size:14px; color:#444; line-height:1.6;">
            <!-- You can use basic Liquid conditional statements here for the explanation text -->
            {% if value == 'The Crowd Pleaser' %}
               With {{ sessions.count_unique_viewers._rendered_value }} viewers, this room draws a crowd.
            {% endif %}
        </div>
    </div>
  ;;
  }

}
