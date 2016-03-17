##
# BluePay Python Sample code.
#
# This code sample runs a report that grabs data from the
# BluePay gateway based on certain criteria. This will ONLY return
# transactions that have already settled. See comments below
# on the details of the report.
# If using TEST mode, only TEST transactions will be returned.
##

import os.path, sys
sys.path.append(os.path.join(os.path.dirname(os.path.realpath(__file__)), os.pardir))
from BluePay import BluePay

account_id = "100228390579"
secret_key = "AKGIF9X9WT9CLQCWDFONC8N3HXRL9Y5K"
mode = "TEST"

report = BluePay(
	 	account_id = account_id, # Merchant's Account ID
	  secret_key = secret_key, # Merchant's Secret Key
	  mode = mode # Transaction Mode: TEST (can also be LIVE)
)

report.get_settled_transaction_report(
    report_start = '2013-01-01', # Report Start Date: Jan. 1, 2013
    report_end = '2013-01-15', # Report End Date: Jan. 15, 2013
    subaccounts_searched = '1', # Also search subaccounts? Yes
    do_not_escape = '1', # Output response without commas? Yes
    exclude_errors = '1' # Do not include errored transactions? Yes
)

# Makes the API request 
report.process()

# Reads the response from BluePay
print report.response