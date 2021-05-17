# 'fee_type' can be "Free" or "Paid"
def vaccine_available_in_centers(centers, age_and_above, fee_type) 
    session_with_vaccine = centers
        .find_all { |center| center["fee_type"] == fee_type }
        .map { |center| center["sessions"] }
        .flat_map { |session| session }
        .find_all { |session| session["min_age_limit"] <= age_and_above and session["available_capacity"] > 0 }
end