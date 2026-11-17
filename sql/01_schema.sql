
CREATE DATABASE QueueFlowDB;
GO

USE QueueFlowDB;
GO

-- 1. CUSTOMER
CREATE TABLE Customer (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15)
);

-- 2. AGENT
CREATE TABLE Agent (
    agent_id INT IDENTITY(1,1) PRIMARY KEY,
    agent_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    availability_status VARCHAR(20) NOT NULL
        CHECK (availability_status IN ('Available', 'Busy', 'Offline'))
);

-- 3. SKILL
CREATE TABLE Skill (
    skill_id INT IDENTITY(1,1) PRIMARY KEY,
    skill_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255)
);

-- 4. AGENT_SKILL
CREATE TABLE AgentSkill (
    agent_id INT NOT NULL,
    skill_id INT NOT NULL,
    proficiency_level VARCHAR(20),
    PRIMARY KEY (agent_id, skill_id),
    FOREIGN KEY (agent_id) REFERENCES Agent(agent_id)
        ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
        ON DELETE CASCADE
);

-- 5. REQUEST
CREATE TABLE Request (
    request_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    skill_id INT NOT NULL,
    request_description VARCHAR(500),
    priority VARCHAR(20) NOT NULL DEFAULT 'Medium'
        CHECK (priority IN ('Low', 'Medium', 'High')),
    status VARCHAR(20) NOT NULL DEFAULT 'Pending'
        CHECK (status IN ('Pending', 'Assigned', 'Completed', 'Cancelled')),
    created_at DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);

-- 6. ROUTING_DECISION
CREATE TABLE RoutingDecision (
    decision_id INT IDENTITY(1,1) PRIMARY KEY,
    request_id INT NOT NULL,
    agent_id INT NOT NULL,
    decision_status VARCHAR(20) NOT NULL DEFAULT 'Assigned'
        CHECK (decision_status IN ('Assigned', 'Rejected', 'Completed')),
    decision_time DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    FOREIGN KEY (request_id) REFERENCES Request(request_id),
    FOREIGN KEY (agent_id) REFERENCES Agent(agent_id)
);

-- Verify table creation
SELECT TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO
