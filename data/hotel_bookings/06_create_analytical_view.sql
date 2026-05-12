CREATE OR REPLACE VIEW analytics.v_final_project_analysis AS
SELECT 
    hb.is_canceled,
    hb.lead_time,
    hb.arrival_date_year,
    hb.arrival_date_month,
    hb.stays_in_weekend_nights + hb.stays_in_week_nights AS total_nights,
    hb.adults,
    hb.children,
    hb.babies,
    hb.adr,
    -- Joining your 5 tables from Screenshot 2026-05-12 205608.jpg
    h.hotel_name,
    c.country_code,
    m.meal_type,
    r_res.room_type AS reserved_room,
    r_ass.room_type AS assigned_room,
    a.agent_code,
    a.company
FROM analytics.hotel_bookings hb
-- 1. Join Hotels
LEFT JOIN analytics.hotels h ON hb.hotel = h.hotel_name
-- 2. Join Countries
LEFT JOIN analytics.countries c ON hb.country = c.country_code
-- 3. Join Meals
LEFT JOIN analytics.meals m ON hb.meal = m.meal_type
-- 4. Join Rooms (Reserved)
LEFT JOIN analytics.rooms r_res ON hb.reserved_room_type = r_res.room_type
-- 5. Join Rooms (Assigned)
LEFT JOIN analytics.rooms r_ass ON hb.assigned_room_type = r_ass.room_type
-- 6. Join Agents
LEFT JOIN analytics.agents a ON 
    NULLIF(hb.agent, 'NULL')::NUMERIC = a.agent_code 
    AND NULLIF(hb.company, 'NULL')::NUMERIC = a.company;