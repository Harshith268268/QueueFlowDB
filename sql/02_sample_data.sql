
USE QueueFlowDB;
GO

-- 1. CUSTOMERS
INSERT INTO Customer (customer_name, email, phone)
VALUES
('Arun Kumar', 'arun@gmail.com', '9876543210'),
('Priya Sharma', 'priya@gmail.com', '9876543211'),
('Rahul Verma', 'rahul@gmail.com', '9876543212'),
('Sneha Reddy', 'sneha@gmail.com', '9876543213'),
('Kiran Rao', 'kiran@gmail.com', '9876543214');

-- 2. AGENTS
INSERT INTO Agent (agent_name, email, availability_status)
VALUES
('John Smith', 'john@queueflow.com', 'Available'),
('Meera Das', 'meera@queueflow.com', 'Available'),
('David Raj', 'david@queueflow.com', 'Busy'),
('Ananya Roy', 'ananya@queueflow.com', 'Available');

-- 3. SKILLS
INSERT INTO Skill (skill_name, description)
VALUES
('Technical Support', 'Handles technical issues'),
('Billing', 'Handles payment and billing queries'),
('Account Management', 'Handles account-related requests'),
('Network Support', 'Handles network connectivity issues');

-- 4. AGENT SKILLS
INSERT INTO AgentSkill (agent_id, skill_id, proficiency_level)
VALUES
(1, 1, 'Expert'),
(1, 4, 'Intermediate'),
(2, 2, 'Expert'),
(2, 3, 'Intermediate'),
(3, 1, 'Intermediate'),
(4, 3, 'Expert'),
(4, 4, 'Expert');

-- 5. REQUESTS
INSERT INTO Request
(customer_id, skill_id, request_description, priority, status)
VALUES
(1, 1, 'Unable to access application', 'High', 'Assigned'),
(2, 2, 'Payment deducted twice', 'High', 'Assigned'),
(3, 3, 'Update registered email address', 'Medium', 'Pending'),
(4, 4, 'Internet connection is unstable', 'High', 'Assigned'),
(5, 1, 'Application loading slowly', 'Low', 'Pending');

-- 6. ROUTING DECISIONS
INSERT INTO RoutingDecision
(request_id, agent_id, decision_status)
VALUES
(1, 1, 'Assigned'),
(2, 2, 'Assigned'),
(4, 4, 'Assigned');

-- VERIFY INSERTED DATA
SELECT * FROM Customer;
SELECT * FROM Agent;
SELECT * FROM Skill;
SELECT * FROM AgentSkill;
SELECT * FROM Request;
SELECT * FROM RoutingDecision;
GO
