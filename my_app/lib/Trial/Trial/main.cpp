void sendRequestHandicapped(Service service){
    pair (var,var) coordinates;
    var time;
    coordinates = get_gps_location();
    update_location_on_server(coordinates);
    
    sla.open();
    time = get_current_timing();
    if( server_request (id_handicapped,service,time) == true){
        service.caregiver = get_info_caregiver();
        track_service();
    }
    else
        cout<<"cannot find caregiver now"<<endl;
}

bool server_request(string id_handicapped,Service service,var time){
    pair (var,var) coordinates;
    string care_giver_id;
    bool flag = false;
    coordinates = handicapped_get_location();
    
    while(flag == false || no more caregivers){
        care_giver_id = search_aregiver(service,coordinates);
        if(care_giver.accpted_flag == true)
            flag = true;
    }
    
    if (flag == false)
        return false;
    else{
        connect_handicapped_caregiver(care_giver_id, id_handicapped);
        block caregiver();
        sla.end();
        start_service_stopwatch();
        activate_survallence();
        request_info_update_from_both_users();
        return true;
    }
    
}

string search_caregiver(Service service, pair (var,var) coordinates){
    
    
}

caregiver get_caregiver_info(){
    
}

  connect_handicapped_caregiver(care_giver_id, id_handicapped){
    
}
