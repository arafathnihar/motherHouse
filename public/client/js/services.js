var myApp = angular.module('motherHouseServices', []);

myApp.factory('UtilityService', function(WebService) {
    return {
        getCountries: function() {
            var countryReqestObject = {
                method: 'GET',
                url: '/commons/countries/'
            }
            var countryReqest = WebService.callWebService(countryReqestObject).then(function(data) {
                return data.data;
            });
            return countryReqest;
        },
        getAgentList: function() {
            var agentListReqestObject = {
                method: 'GET',
                url: '/api/v1/agents'
            }
            var agentListReqest = WebService.callWebService(agentListReqestObject).then(function(responseData) {
                return responseData.data
            });
            return agentListReqest;
        },
        getCurrencies: function() {
            var currencyReqestObject = {
                method: 'GET',
                url: '/commons/currencies/'
            }
            var currencyReqest = WebService.callWebService(currencyReqestObject).then(function(data) {
                return data.data;
            });
            return currencyReqest;
        },
        getReceivingAgentList: function() {
            var receivingAgentListReqestObject = {
                method: 'GET',
                url: '/api/v1/receiving_agents'
            }
            var receivingAgentListReqest = WebService.callWebService(receivingAgentListReqestObject).then(function(data) {
                return data.data;
            });
            return receivingAgentListReqest
        },
        getCurrenciesKeyVal: function(array,key){
            debugger;
            var arrayKeyVal = [];
            array.forEach(function(obj) {
                var tempkey = obj[key];
                var objKeyVal = {key:obj};
                arrayKeyVal.push(objKeyVal);                
            });
            console.log(objKeyVal);
        }
    }
});
myApp.factory('WebService', function($http) {
    return {
        callWebService: function(reqestObject) {
            return $http(reqestObject);
        }
    }
});