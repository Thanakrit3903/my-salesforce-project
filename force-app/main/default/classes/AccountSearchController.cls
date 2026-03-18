public with sharing class AccountSearchController {

    @AuraEnabled(cacheable=true)
    public static List<Account> searchAccounts(String searchKey){

        return [
            SELECT Id, Name, Industry, Description
            FROM Account
            WHERE Name LIKE :('%' + searchKey + '%')
            LIMIT 10
        ];

    }

}