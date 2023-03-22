function fn() {
    var env = karate.env == null? "development" : karate.env;
    karate.log("karate.env system property is:", env);
    var config = read("classpath:karate-config.json");
    return Object.assign(config[env]);
}
