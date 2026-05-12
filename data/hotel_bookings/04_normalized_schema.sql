-- 1. Hotels
CREATE TABLE analytics.hotels (
    hotel_id SERIAL PRIMARY KEY,
    hotel_name TEXT UNIQUE NOT NULL
);

-- 2. Countries
CREATE TABLE analytics.countries (
    country_id SERIAL PRIMARY KEY,
    country_code TEXT UNIQUE NOT NULL
);

-- 3. Meals
DROP TABLE IF EXISTS analytics.meals CASCADE;

CREATE TABLE analytics.meals (
    meal_id SERIAL PRIMARY KEY,
    meal_type TEXT UNIQUE NOT NULL
);

-- 4. Rooms
CREATE TABLE analytics.rooms (
    room_id SERIAL PRIMARY KEY,
    room_type TEXT UNIQUE NOT NULL
);

-- 5. Agents
CREATE TABLE analytics.agents (
    agent_id SERIAL PRIMARY KEY,
    agent_code NUMERIC(10,2),
    company NUMERIC(10,2)
);