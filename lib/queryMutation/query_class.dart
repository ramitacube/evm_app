class QueryClass {
  final String queryRentalCategory = """
query Query {
 getCompaniesCategories {
    id
    name
    company_id
    category_icon
  }
}
  """;

  final String queryCategoryAttribute = """
  query Query(\$categoryId: ID) {
  category_attr_basedoncategory(category_id: \$categoryId) {
    id
    name
    category_id {
      id
      name
      status
    }
    status
  }
}
  """;

  final String queryRentalPackage = """
  query Query {
 rental_packages(first:50) {
    data {
      id
      package_name
      max_hour
    }
  } 
}
""";

  final String queryRentalOffer = """
  query Offer {
  offer {
    name
    Desc
    id
    media {
      id
      name
      caption
      size
      url
    }
  }
}
  """;

  final String queryBundle = """ 
query PackagebundlesCategory(\$categoryId: ID!) {
  packagebundlesCategory(category_id: \$categoryId) {
    id
    bundle_name
    base_km_hr
  }
}
""";

  final String queryDistrict = """
query Cities {
  cities {
    id
    name
    status
  }
}
""";

  final String queryHub = """
  query Locationoncity(\$cityId: Int) {
  locationoncity(city_id: \$cityId) {
    id
    address
    pincode
    latitude
    longitude
    location_name
  }
}
  """;

  final String queryPrivacy = """
 query PrivacyPolicy {
  privacyPolicy {
    id
    created_at
    updated_at
    Title
    Desc
  }
}
  """;

  final String queryRental = """
  query Rental(\$customerId: Int) {
  rental(customer_id: \$customerId) {
       id
    rental_details {
      drop_date
      pickup_date
      pickup_location_id {
        location_name
        address
      }
      drop_location_id {
        address
        location_name
      }
    }
    rental_date
    user {
      name
      email
      phone
    }
    products {
      name
      product_attrs {
        head {
          name
        }
        head_value {
          name
        }
      }
    }
  }
}
  """;
  final String bookingRental = """
  query Query(\$customerId: Int) {
  rental(customer_id: \$customerId) {
    id
    company {
      id
      status
      settings {
        id
        key
        value
      }
    }
    products {
      id
      name
      product_image {
        id
        document_url
      }
      product_attrs {
        head {
          id
          name
          status
        }
        head_value {
          id
          name
        }
      }
    }
    rental_date
    rental_status_id {
      id
      status_name
    }
    rental_details {
      drop_date
      drop_location_id {
        id
        location_name
        address
      }
      pickup_date
      pickup_location_id {
        id
        address
        location_name
      }
      rental_detail_rates {
        sub_total
        tax
        amount
        base_rate
      }
    }
    user {
      id
      name
      email
      phone
    }
  }
}
""";
  final String getHeader = """
  query ProductAttrHeadWithValue {
  productAttrHeadWithValue {
    id
    name
    status
    head_value {
      id
      name
      status
    }
  }
}
  """;
}
