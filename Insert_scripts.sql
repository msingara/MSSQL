-- insert rows into the region table
INSERT INTO region(head_end, state,city,zipcode,comp_code)
 VALUES
 ('YORK', 'NC', 'CHARLOTTE' ,'29745','ATT'),
('MECK', 'NC', 'CHARLOTTE' ,'28273','CHTR'),
('UNN', 'NC', 'CHARLOTTE' ,'28079','GOOG');

-- Group Project 2 insert rows into region table
INSERT INTO region(head_end, state,city,zipcode,comp_code)
 VALUES
 ('GATN', 'NC', 'CHARLOTTE' ,'28006','ATT'),
('CBRS', 'NC', 'CHARLOTTE' ,'28025','CHTR');

-- insert rows into the Customer table
INSERT INTO Customer(customer_id,last_name,first_name,user_name,head_end)
 VALUES
 (1001, 'Singaravel', 'Murali' ,'msinagara','YORK'),
(1002, 'Spaulding', 'Sydney' ,'sspauld5','MECK'),
(1003, 'Vellore', 'Krithika' ,'kvellore','MECK'),
(1004, 'Shaw', 'George' ,'gshaw','UNN');

-- Group Project 2 insert rows into customer table
INSERT INTO Customer(customer_id,last_name,first_name,user_name,head_end)
 VALUES
 (1005, 'Jose', 'Mary' ,'msjose','GATN');

-- insert rows into the plan table
INSERT INTO plan(plan_id,plan,plan_desc)
 VALUES
 (101, 'Gold','unlimited internet 400 cable unlimited voice' ),
 (201, 'Silver','50 GB internet 200 cable unlimited voice' ),
 (301, 'Bronze','20 GB internet basic cable' );

-- Group Project 2 insert into plan table
 INSERT INTO plan(plan_id,plan,plan_desc)
 VALUES
 (401, 'Basic I','10 GB internet basic cable' ),
 (501, 'Basic Internet Only','10 GB internet only' ),
 (601, 'Basic Cable Only','Basic cable' ),
 (701, 'Basic Phone Only','Unlimited phone' );

-- insert rows into the subscription table
INSERT INTO subscription(subscription_id,start_date,offer_code,customer_id,offer_end_date,plan_id)
 VALUES
 (1001, '2018-01-01','NEW', 1001, '2018-12-31',101),
 (1002, '2018-06-01','CROSEL', 1004, '2018-12-31',101),
 (1003, '2018-11-01','NA', 1002, NULL,301),
 (1004, '2017-11-01','NEW', 1003, '2018-11-01',201);
  
  -- Group Project 2 insert into subscription table
  INSERT INTO subscription(subscription_id,start_date,offer_code,customer_id,offer_end_date,plan_id)
 VALUES
 (1005, '2016-12-01','NEW', 1005, '2017-12-01',501),
 (1006, '2016-12-01','NEW', 1005, '2017-12-01',601),
 (1007, '2018-12-01','NA', 1002, NULL,701);
 
  -- Group Project 2 inserts 
  -- insert rows into billing table
  INSERT INTO billing(account_number, account_type, bill_amount, balance_due, billing_date, customer_id, subscription_id)
  VALUES
    (100001, 'Residential','400.00','0.00','2018-11-01',1001,1001),
    (100002, 'Residential','100.00','100.00','2018-11-15',1002,1003),
    (100003, 'Residential','50.00','50.00','2018-12-01',1002,1007),
    (100004, 'Residential','300.00','300.00','2018-11-01',1003,1004),
    (100005, 'Residential','400.00','0.00','2018-11-01',1004,1002),
	(100006, 'Residential','60.00','0.00','2018-11-01',1005,1005),
	(100007, 'Residential','75.00','75.00','2018-11-15',1005,1006)
;



