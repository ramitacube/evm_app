class MutationClass{

  final String register="""
mutation Mutation(\$input: RegisterInput) {
  customerRegister(input: \$input) {
    status
    tokens {
      access_token
      user {
        otp
      }
    }
  }
}
  """;

  final String search="""
  mutation GetFilteredProducts(\$input: GetRentalTariffsInput) {
  GetFilteredProducts(input: \$input) {
    id
    name
    products {
      id
      customer_rate
      category_id
      category_attr_id
      name
      items_count
      booking_count
      status
      package_id
      bundle_id
      document_url
      product_rentals_count
      stock_status
      product_attrs {
        id
        head_value
        head
      }
    }
  }
}
  """;

  final String otpVerification="""
  mutation VerifyOTP(\$input: VerifyOTPInput!) {
  VerifyOTP(input: \$input)
}
  """;


  final String logIn="""
  mutation Login(\$input: LoginInput) {
  login(input: \$input) {
    user {
      id
      name
      email
      phone
      gender
      dob
      address
      otp
    }
    access_token
  }
}
  """;


  final String otpSend="""mutation ResendOtp(\$input: resendOtpInput) {
  resendOtp(input: \$input)
}""";


  final String loginOtp = """mutation LoginOtp(\$input: LoginOtpInput) {
  loginOtp(input: \$input) {
  access_token
  user {
  id
  name
  email
  phone
  gender
  is_verified
  is_email_verified
  dob
  lastname
  address
  Userimage {
  document_url
  key
  }
  }
  }
  }""";
  final String createRental="""
  mutation CreateRental(\$input: CreateRentalInput) {
  CreateRental(input: \$input) {
    id
    products {
      name
      product_image {
        document_url
      }
    }
    rental_date
    rental_details {
      rental_id {
        id
      }
      customer_id {
        name
      }
      pickup_date
      pickup_location_id {
        location_name
      }
      drop_date
      drop_location_id {
        location_name
      }
    }
  }
}
  """;

  final getRentalDetails ="""
mutation CreateRentalDetails(\$input: CreateRentalDetailsInput) {
  CreateRentalDetails(input: \$input) {
    id
    name
    address
    pickup
    rental_id
    customer_id
    pickup_date
    pickup_location_id
    drop_date
    drop_location_id
    drop
    rental_date
    status_name
    base_rate
    additinal_km_rate
    additinal_hour_rate
    rental_details_id
    amount
    tax
    sub_total
    rental_attributes {
      label_name
      value
    }
    rental_product {
      name
      product_attrs {
        head_value
        head
      }
    }
  }
}
  """;



}