def model(dbt, session):
    model_recommendations = dbt.ref('int_production_model_wh_recommendations')
    model_recommendations_df = model_recommendations.to_pandas()

    # Calculate mode across all columns starting with 'WAREHOUSE_REC_BY_'
    # We can always grab the first mode because we only have three values and could never have a second mode
    mode_of_recommendations = model_recommendations_df.filter(like='WAREHOUSE_REC_BY_').mode(axis = 1).iloc[:,0]  # Takes the minimum if there is no mode
    min_of_recommendations = model_recommendations_df.filter(like='WAREHOUSE_REC_BY_').min(axis = 1)
    med_of_recommendations = model_recommendations_df.filter(like='WAREHOUSE_REC_BY_').median(axis = 1)
    max_of_recommendations = model_recommendations_df.filter(like='WAREHOUSE_REC_BY_').max(axis = 1)
    
    # Rejoin mode series to dataframe 
    final_df = (
        model_recommendations_df.merge(mode_of_recommendations.rename('RECOMMENDED_WAREHOUSE_SIZE'), left_index=True, right_index=True)
        .merge(min_of_recommendations.rename('MIN_WAREHOUSE_SIZE'), left_index=True, right_index=True)
        .merge(med_of_recommendations.rename('MEDIAN_WAREHOUSE_SIZE'), left_index=True, right_index=True)
        .merge(max_of_recommendations.rename('MAX_WAREHOUSE_SIZE'), left_index=True, right_index=True)
    )

    return final_df