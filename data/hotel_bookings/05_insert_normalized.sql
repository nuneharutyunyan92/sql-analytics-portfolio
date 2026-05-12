-- 1. Hotels
INSERT INTO analytics.hotels (hotel_name)
SELECT DISTINCT hotel 
FROM analytics.hotel_bookings;

-- 2. Countries
INSERT INTO analytics.countries (country_code)
SELECT DISTINCT country 
FROM analytics.hotel_bookings
WHERE country IS NOT NULL AND country <> '' AND country <> 'NULL';

-- 3. Meals
INSERT INTO analytics.meals (meal_type)
SELECT DISTINCT meal 
FROM analytics.hotel_bookings
WHERE meal IS NOT NULL AND meal <> '';

-- 4. Rooms
INSERT INTO analytics.rooms (room_type)
SELECT DISTINCT reserved_room_type 
FROM analytics.hotel_bookings
UNION
SELECT DISTINCT assigned_room_type 
FROM analytics.hotel_bookings;

-- 5. Agents
INSERT INTO analytics.agents (agent_code, company)
SELECT DISTINCT 
    NULLIF(agent, 'NULL')::NUMERIC(10,2),
    NULLIF(company, 'NULL')::NUMERIC(10,2)
FROM analytics.hotel_bookings
ON CONFLICT DO NOTHING;

