-- Oracle PL/SQL demonstration. Caller controls COMMIT/ROLLBACK.
-- Locking the row prevents concurrent return of the same loan.
CREATE OR REPLACE PROCEDURE return_book (p_loan_id IN NUMBER)
AS
    v_returned_on loans.returned_on%TYPE;
BEGIN
    SELECT returned_on
      INTO v_returned_on
      FROM loans
     WHERE loan_id = p_loan_id
       FOR UPDATE;

    IF v_returned_on IS NOT NULL THEN
        RAISE_APPLICATION_ERROR(-20001, 'This loan has already been returned');
    END IF;

    UPDATE loans
       SET returned_on = TRUNC(SYSDATE)
     WHERE loan_id = p_loan_id;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Loan does not exist');
END return_book;
/
