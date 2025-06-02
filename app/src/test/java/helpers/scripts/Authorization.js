function getAuthorizeConfig(username) {
    var config = {
        client_id: "",
        password: ""
    };

    switch (username) {
        case 'testuser1':
            config.client_id = "TPS";
            config.password = "Bam2020Test123.";
            break;
        default:
            throw new Error('Usuario no definido: ' + username);
    }
    return config;
}