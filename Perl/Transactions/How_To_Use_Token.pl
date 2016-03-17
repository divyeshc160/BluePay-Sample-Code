##
# BluePay Perl Sample code.
#
# Charges a customer $3.00 using the payment and customer information from a previous transaction. 
# If using TEST mode, odd dollar amounts will return
# an approval and even dollar amounts will return a decline.
##

use strict;
use lib '..';
use bluepay;

my $account_id = "100228390579";
my $secret_key = "AKGIF9X9WT9CLQCWDFONC8N3HXRL9Y5K";
my $mode = "TEST";

my $token = "100231150475"; # The transaction ID of a previous sale

my $payment = BluePay->new(
	$account_id, 
	$secret_key, 
	$mode
);
       
$payment->sale({
	amount => '3.00',
	trans_id => $token # The transaction ID of a previous sale
}); 

# Makes the API Request
$payment->process();

# Reads the response from BluePay
if ($payment->is_successful_response()){
	print "TRANSACTION STATUS: " . $payment->{Result} . "\n";
	print "TRANSACTION MESSAGE: " . $payment->{MESSAGE} . "\n";
	print "TRANSACTION ID: " . $payment->{RRNO} . "\n";
	print "AVS RESULT: " .$payment->{AVS} . "\n";
	print "CVV2 RESULT: " . $payment->{CVV2} . "\n";
	print "MASKED PAYMENT ACCOUNT: " . $payment->{PAYMENT_ACCOUNT} . "\n";
	print "CARD TYPE: " . $payment->{CARD_TYPE} . "\n";
	print "AUTH CODE: " . $payment->{AUTH_CODE} . "\n";
} else {
	print $payment->{MESSAGE} . "\n";
}