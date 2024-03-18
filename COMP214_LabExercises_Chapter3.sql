-- Assignment 3-1: Querying Data in a Block
-- A Brewbean’s application page is being developed for employees to enter a basket number and
-- view shipping information for the order that includes date, shipper, and shipping number. An
-- IDSTAGE value of 5 in the BB_BASKETSTATUS table indicates that the order has been
-- shipped. In this assignment, you create a block using scalar variables to hold the data retrieved
-- from the database. Follow these steps to create a block for checking shipping information:
-- 1. Start SQL Developer, if necessary.
-- 2. Open the assignment03-01.sql file in the Chapter03 folder.
-- 3. Review the code, and note the use of scalar variables to hold the values retrieved in the
-- SELECT statement.
-- 4. Add data type assignments to the first three variables declared. These variables will be
-- used to hold data retrieved from a query.
-- 5. Run the block for basket ID 3, and compare the results with Figure 3-29.
-- 6. Now try to run this same block with a basket ID that has no shipping information recorded.
-- Edit the basket ID variable to be 7.
-- 7. Run the block again, and review the error shown in Figure 3-30.
DECLARE
    lv_ship_date   bb_basketstatus.dtstage%TYPE := SYSDATE;
    lv_shipper_txt bb_basketstatus.shipper%TYPE := 'Default Shipper';
    lv_ship_num    bb_basketstatus.shippingnum%TYPE := 1;
    lv_bask_num    bb_basketstatus.idbasket%TYPE := 3;
 -- lv_bask_num    bb_basketstatus.idbasket%TYPE := 7;
BEGIN
    SELECT
        dtstage,
        shipper,
        shippingnum INTO lv_ship_date,
        lv_shipper_txt,
        lv_ship_num
    FROM
        bb_basketstatus
    WHERE
        idbasket = lv_bask_num
        AND idstage = 5;
    DBMS_OUTPUT.PUT_LINE('Date Shipped: '
                         ||lv_ship_date);
    DBMS_OUTPUT.PUT_LINE('Shipper: '
                         ||lv_shipper_txt);
    DBMS_OUTPUT.PUT_LINE('Shipping #: '
                         ||lv_ship_num);
END;
 -- Assignment 3-2: Using a Record Variable
 -- A Brewbean’s application page is being developed for employees to enter a basket number
 -- and view shipping information for the order. The page needs to display all column values from
 -- the BB_BASKETSTATUS table. An IDSTAGE value of 5 in the BB_BASKETSTATUS table
 -- indicates that the order has been shipped. Follow these steps to create a block with a
 -- record variable:
 -- 1. Start SQL Developer, if necessary.
 -- 2. Open the assignment03-02.sql file in the Chapter03 folder.
 -- 3. Review the code, and note the use of a record variable to hold the values retrieved in the
 -- SELECT statement. Also, notice that the record variable’s values are referenced separately
 -- in the DBMS_OUTPUT statements.
 -- 4. Run the block, and compare the results with Figure 3-31.
DECLARE
    rec_ship    bb_basketstatus%ROWTYPE;
    lv_bask_num bb_basketstatus.idbasket%TYPE := 3;
BEGIN
    SELECT
        * INTO rec_ship
    FROM
        bb_basketstatus
    WHERE
        idbasket = lv_bask_num
        AND idstage = 5;
    DBMS_OUTPUT.PUT_LINE('Date Shipped: '
                         ||rec_ship.dtstage);
    DBMS_OUTPUT.PUT_LINE('Shipper: '
                         ||rec_ship.shipper);
    DBMS_OUTPUT.PUT_LINE('Shipping #: '
                         ||rec_ship.shippingnum);
    DBMS_OUTPUT.PUT_LINE('Notes: '
                         ||rec_ship.notes);
END;

 -- Assignment 3-3: Processing Database Data with IF Statements
 -- The Brewbean’s application needs a block to determine whether a customer is rated HIGH,
 -- MID, or LOW based on his or her total purchases. The block needs to select the total amount of
 -- orders for a specified customer, determine the rating, and then display the results onscreen. The
 -- code rates the customer HIGH if total purchases are greater than $200, MID if greater than
 -- $100, and LOW if $100 or lower. Use an initialized variable to provide the shopper ID.
 -- 1. Start SQL Developer, if necessary.
 -- 2. Open the assignment03-03.sql file from the Chapter03 folder. Review the partial block.
 -- Edit the block to perform the required task.
 -- 3. Run the block and verify the results. Enter and run the following SQL query to confirm that
 -- the total for this shopper is indeed greater than $200:
 -- SELECT SUM(total)
 -- FROM bb_basket
 -- WHERE idShopper = 22
 -- AND orderplaced = 1
 -- GROUP BY idshopper;
 -- 4. Test other shoppers who have a completed order.
DECLARE
    lv_total_num  NUMBER(6, 2);
    lv_rating_txt VARCHAR2(4);
    lv_shop_num   bb_basket.idshopper%TYPE := 22;
BEGIN
    SELECT
        SUM(total) INTO lv_total_num
    FROM
        bb_basket
    WHERE
        idShopper = lv_shop_num
        AND orderplaced = 1
    GROUP BY
        idshopper;
    IF lv_total_num > 200 THEN
        lv_rating_txt := 'HIGH';
    ELSIF lv_total_num > 100 THEN
        lv_rating_txt := 'MID';
    ELSE
        lv_rating_txt := 'LOW';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Shopper '
                         ||lv_shop_num
                         ||' is rated '
                         ||lv_rating_txt);
END;
