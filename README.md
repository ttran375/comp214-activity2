# Group Lab Activity #2

## Assignment 3-1: Querying Data in a Block

A Brewbean’s application page is being developed for employees to enter a basket number and
view shipping information for the order that includes date, shipper, and shipping number. An
IDSTAGE value of 5 in the BB_BASKETSTATUS table indicates that the order has been
shipped. In this assignment, you create a block using scalar variables to hold the data retrieved
from the database. Follow these steps to create a block for checking shipping information:
1. Start SQL Developer, if necessary.
2. Open the assignment03-01.sql file in the Chapter03 folder.
3. Review the code, and note the use of scalar variables to hold the values retrieved in the
SELECT statement.
4. Add data type assignments to the first three variables declared. These variables will be
used to hold data retrieved from a query.
5. Run the block for basket ID 3, and compare the results with Figure 3-29.
6. Now try to run this same block with a basket ID that has no shipping information recorded.
Edit the basket ID variable to be 7.
7. Run the block again, and review the error shown in Figure 3-30.

## Assignment 3-2: Using a Record Variable

A Brewbean’s application page is being developed for employees to enter a basket number
and view shipping information for the order. The page needs to display all column values from
the BB_BASKETSTATUS table. An IDSTAGE value of 5 in the BB_BASKETSTATUS table
indicates that the order has been shipped. Follow these steps to create a block with a
record variable:
1. Start SQL Developer, if necessary.
2. Open the assignment03-02.sql file in the Chapter03 folder.
3. Review the code, and note the use of a record variable to hold the values retrieved in the
SELECT statement. Also, notice that the record variable’s values are referenced separately
in the DBMS_OUTPUT statements.
4. Run the block, and compare the results with Figure 3-31.

## Assignment 3-3: Processing Database Data with IF Statements

The Brewbean’s application needs a block to determine whether a customer is rated HIGH,
MID, or LOW based on his or her total purchases. The block needs to select the total amount of
orders for a specified customer, determine the rating, and then display the results onscreen. The
code rates the customer HIGH if total purchases are greater than $200, MID if greater than
$100, and LOW if $100 or lower. Use an initialized variable to provide the shopper ID.
1. Start SQL Developer, if necessary.
2. Open the assignment03-03.sql file from the Chapter03 folder. Review the partial block.
Edit the block to perform the required task.
3. Run the block and verify the results. Enter and run the following SQL query to confirm that
the total for this shopper is indeed greater than $200:
SELECT SUM(total)
FROM bb_basket
WHERE idShopper = 22
AND orderplaced = 1
GROUP BY idshopper;
