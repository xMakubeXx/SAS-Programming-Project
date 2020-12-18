data donepaper;
set work.finalstatsdata;
overall_status=.;
if loan_status='Fully Paid' then overal_status=0;
if loan_status = 'Does not me' then overall_status=0;
            if loan_status= 'Charged Off' then overall_status = 1;
             run;

proc glmselect data=work.donepaper;
model overall_status = loan_amnt dti total_pymnt open_acc total_acc pub_rec annual_inc delinq_amnt installment;
partition fraction(test=0.25 validate=0.25);
store out=work.realdata;
run;