[![Build Status](https://secure.travis-ci.org/cobot/veritrans-ruby.png)](http://travis-ci.org/cobot/veritrans-ruby)

## Description

Ruby Wrapper for preparinng data to submit to veritrans server and get token for further process

## Installation

     $ gem install veritrans

## Example Usage

Getting the encryption tokens:

    require 'veritrans'
    client = Veritrans::Client.new

    client.merchant_id = '...'
    client.merchant_hash_key = '...'

    client.config['server_host'] = '...'

    client.finish_payment_return_url = '...' # url to return to after payment
    client.finish_payment_access_url = '...' # server to server callback url


    client.order_id     = SecureRandom.hex
    client.session_id   = SecureRandom.hex
    client.gross_amount = "10"
    client.commodity    = [ # optional
      {"COMMODITY_ID"    => "IDxx1",
       "COMMODITY_UNIT"  => "10",
       "COMMODITY_NUM"   => "1",
       "COMMODITY_NAME1" => "Waterbotle",
       "COMMODITY_NAME2" => "Waterbottle in Indonesian"
      }
    ]

    # all optional
    client.shipping_flag         = "1"
    client.shipping_first_name   = "Sam"
    client.shipping_last_name    = "Anthony"
    client.shipping_address1     = "Buaran I"
    client.shipping_address2     = "Pulogadung"
    client.shipping_city         = "Jakarta"
    client.shipping_country_code = "IDN"
    client.shipping_postal_code  = "16954"
    client.shipping_phone        = "0123456789123"
    client..shipping_method      = "N"

    client.get_keys # => {"MERCHANT_ENCRYPTION_KEY" => '...', "BROWSER_ENCRYPTION_KEY" => '...'}

Generating a redirect URL for the user's browser:

    client.redirect_url('<browser encryption key>')

