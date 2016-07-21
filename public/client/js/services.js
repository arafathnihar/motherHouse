var myApp = angular.module('motherHouseServices', []);

myApp.factory('ApiService', function (WebService, UtilityService) {
    return {
        getCountries: function () {
            var requestObject = UtilityService.createRequestObject('GET', '/commons/countries/');
            return WebService.callWebService(requestObject);
        },
        getAgentList: function () {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/agents');
            return WebService.callWebService(requestObject);
        },
        getCurrencies: function () {
            var requestObject = UtilityService.createRequestObject('GET', '/commons/currencies/');
            return WebService.callWebService(requestObject);
        },
        getReceivingAgentList: function () {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/receiving_agents');
            return WebService.callWebService(requestObject);
        },
        getOrderList: function () {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/orders');
            return WebService.callWebService(requestObject);
        },
        getMainAccountsByDate: function (fromDate, toDate) {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/agentaccount/' + fromDate + '/' + toDate);
            return WebService.callWebService(requestObject);
        },
        getAgentAccountsByDate: function (agentId, fromDate, toDate) {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/agentaccount/' + agentId + '/' + fromDate + '/' + toDate);
            return WebService.callWebService(requestObject);
        },
        getAgentById: function (agentId) {
            var agentRequestObject = UtilityService.createRequestObject('GET', '/api/v1/agents/' + agentId);
            return WebService.callWebService(agentRequestObject);
        },
        updateAgent: function (agentId, agent) {
            var requestObject = UtilityService.createRequestObject('PUT', '/api/v1/agents/' + agentId, agent);
            return WebService.callWebService(requestObject);
        },
        addAgent: function (agent) {
            var requestObject = UtilityService.createRequestObject('POST', '/api/v1/agents/', agent);
            return WebService.callWebService(requestObject);
        },
        getReceivingAgentById: function (receivingAgentId) {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/receiving_agents/' + receivingAgentId);
            return WebService.callWebService(requestObject);
        },
        updateReceivingAgent: function (receivingAgentId, receivingagent) {
            var requestObject = UtilityService.createRequestObject('PUT', '/api/v1/receiving_agents/' + receivingAgentId, receivingagent);
            return WebService.callWebService(requestObject);
        },
        addReceivingAgent: function (receivingagent) {
            var requestObject = UtilityService.createRequestObject('POST', '/api/v1/receiving_agents', receivingagent);
            return WebService.callWebService(requestObject);
        },
        getOrderById: function (orderId) {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/orders/' + orderId);
            return WebService.callWebService(requestObject);
        },
        updateOrder: function (orderId, order) {
            var requestObject = UtilityService.createRequestObject('PUT', '/api/v1/orders/' + orderId, order);
            return WebService.callWebService(requestObject);
        },
        addOrder: function (order) {
            var requestObject = UtilityService.createRequestObject('POST', '/api/v1/orders/', order);
            return WebService.callWebService(requestObject);
        },
        deleteAgent: function (agentId) {
            var requestObject = UtilityService.createRequestObject('DELETE', '/api/v1/agents/' + agentId);
            return WebService.callWebService(requestObject);
        },
        deleteReceivingAgent: function (receiving_agent_id) {
            var requestObject = UtilityService.createRequestObject('DELETE', '/api/v1/receiving_agents/' + receiving_agent_id);
            return WebService.callWebService(requestObject);
        },
        deleteOrder: function (orderId) {
            var requestObject = UtilityService.createRequestObject('DELETE', '/api/v1/orders/' + orderId);
            return WebService.callWebService(requestObject);
        },
        addAgentPayment: function (payment) {
            var requestObject = UtilityService.createRequestObject('POST', '/api/v1/agentaccount', payment);
            return WebService.callWebService(requestObject);
        },
        updateAgentPayment: function (paymentId, payment) {
            var requestObject = UtilityService.createRequestObject('PUT', '/api/v1/agentaccount/' + paymentId, payment);
            return WebService.callWebService(requestObject);
        },
        getAgentPaymentById: function (paymentId) {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/agentaccount/' + paymentId + '/' + paymentId + '/' + paymentId + '/' + paymentId);
            return WebService.callWebService(requestObject);
        },
        deleteAgentPaymentById: function (paymentId) {
            var requestObject = UtilityService.createRequestObject('DELETE', '/api/v1/agentaccount/' + paymentId);
            return WebService.callWebService(requestObject);
        },
        getAgentPaymentListByAgentId: function (agentId) {
            var requestObject = UtilityService.createRequestObject('GET', '/api/v1/agentaccount/' + agentId);
            return WebService.callWebService(requestObject);
        }
    }
});

myApp.factory('WebService', function ($http, blockUI, UtilityService) {
    return {
        callWebService: function (requestObject) {
            return $http(requestObject).then(function (data) {
                blockUI.stop();
                if (requestObject.method == 'POST')
                    UtilityService.toastMessage('success', 'Success fully created', 3000);
                if (requestObject.method == 'PUT')
                    UtilityService.toastMessage('success', 'Success fully updated', 3000);
                if (requestObject.method == 'DELETE')
                    UtilityService.toastMessage('success', 'Success fully deleted', 3000);
                return data.data;
            }, function (error) {
                blockUI.stop();
                var messagesObject = error.data.errors;
                console.log(messagesObject);
                for (var key in messagesObject) {
                    // skip loop if the property is from prototype
                    if (!messagesObject.hasOwnProperty(key))
                        continue;
                    var obj = messagesObject[key];
                    for (var prop in obj) {
                        // skip loop if the property is from prototype
                        if(!obj.hasOwnProperty(prop))
                            continue;
                        // your code
                        UtilityService.toastMessage('danger', obj[prop], 4000);
                    }
                }
                return null;
            });
        }
    }
});

myApp.factory('UtilityService', function (ngToast, blockUI) {
    return {
        toastMessage: function (className, message, timeOut) {
            ngToast.create({
                className: className,
                dismissButton: true,
                content: message,
                horizontalPosition: 'center',
                timeout: timeOut

            });
        },
        createRequestObject: function (method, url, data, headers) {
            blockUI.start();
            var requestObject = {
                method: method,
                url: url,
                headers: {
                    'Content-Type': 'application/json'
                }
            };
            if (headers)
                requestObject.headers = headers;
            if (data)
                requestObject.data = {
                    requestdata: data
                };
            return requestObject;
        },
        clearForm: function (obj) {
            angular.forEach(obj, function (value, option) {
                obj[option] = '';
            });
            return obj;
        },
        yyyymmdd: function (date) {
            return date.getFullYear()+'-' + (date.getMonth()+1) + '-'+date.getDate();
        },
        datepickerConf : function (obj) {
            obj.today = function () {
                obj.date = new Date();
            };

            obj.clear = function () {
                obj.Date = null;
            };

            obj.dateOptions = {
                formatYear: 'yy',
                maxDate: new Date(2020, 12, 31),
                minDate: new Date(1980,01,01),
                startingDay: 1
            };

            obj.dateOpen = function () {
                obj.datePopup.opened = true;
            };

            obj.datePopup = {
                opened: false
            };
            return obj;
        }
    }
});