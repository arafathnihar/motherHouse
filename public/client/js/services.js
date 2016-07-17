var myApp = angular.module('motherHouseServices', []);

myApp.factory('ApiService', function (WebService, UtilityService) {
    return {
        getCountries: function () {
            var countryReqestObject = UtilityService.createRequestObject('GET', '/commons/countries/');
            return WebService.callWebService(countryReqestObject);
        },
        getAgentList: function () {
            var agentListReqestObject = UtilityService.createRequestObject('GET', '/api/v1/agents');
            return WebService.callWebService(agentListReqestObject);
        },
        getCurrencies: function () {
            var currencyReqestObject = UtilityService.createRequestObject('GET', '/commons/currencies/');
            return WebService.callWebService(currencyReqestObject);
        },
        getReceivingAgentList: function () {
            var receivingAgentListReqestObject = UtilityService.createRequestObject('GET', '/api/v1/receiving_agents');
            return WebService.callWebService(receivingAgentListReqestObject);
        },
        getOrderList: function () {
            var orderListReqestObject = UtilityService.createRequestObject('GET', '/api/v1/orders');
            return WebService.callWebService(orderListReqestObject);
        },
        getMainAccounts: function () {
            var mainAccountsReqestObject = UtilityService.createRequestObject('GET', 'https://jsonblob.com/api/5789a4aee4b0dc55a4e4fb6f');
            return WebService.callWebService(mainAccountsReqestObject);
        },
        getAgentById: function (agentId) {
            var agentRequestObject = UtilityService.createRequestObject('GET', '/api/v1/agents/' + agentId);
            return WebService.callWebService(agentRequestObject);
        },
        updateAgent: function (agentId, agent) {
            var updateAgentRequestObject = UtilityService.createRequestObject('PUT', '/api/v1/agents/' + agentId, agent);
            return WebService.callWebService(updateAgentRequestObject);
        },
        addAgent: function (agent) {
            var addAgentRequestObject = UtilityService.createRequestObject('POST', '/api/v1/agents/', agent);
            return WebService.callWebService(addAgentRequestObject);
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
            var addOrderRequestObject = UtilityService.createRequestObject('POST', '/api/v1/orders/', order);
            return WebService.callWebService(addOrderRequestObject);
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
            var addAgentPaymentRequestObject = UtilityService.createRequestObject('POST', '/api/v1/agentaccount', payment);
            return WebService.callWebService(addAgentPaymentRequestObject);

        }
    }
});

myApp.factory('WebService', function ($http, blockUI, UtilityService) {
    return {
        callWebService: function (reqestObject) {
            return $http(reqestObject).then(function (data) {
                blockUI.stop();
                if (reqestObject.method == 'POST')
                    UtilityService.toastMessage('success', 'Success fully created', 3000);
                if (reqestObject.method == 'PUT')
                    UtilityService.toastMessage('success', 'Success fully updated', 3000);
                if (reqestObject.method == 'DELETE')
                    UtilityService.toastMessage('success', 'Success fully deleted', 3000);
                return data.data;
            }, function (error) {
                blockUI.stop();
                UtilityService.toastMessage('danger', 'An Internal error occurred !!!', 3000);
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
        }
    }
});