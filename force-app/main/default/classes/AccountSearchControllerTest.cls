@isTest
private class AccountSearchControllerTest {

    @testSetup
    static void setup() {
        List<Account> testAccs = new List<Account>();
        testAccs.add(new Account(Name = 'Apple Inc', Industry = 'Technology'));
        testAccs.add(new Account(Name = 'Alphabet', Industry = 'Technology'));
        testAccs.add(new Account(Name = 'Salesforce', Industry = 'Technology'));
        insert testAccs;
    }

    @isTest
    static void testSearchAccountsFound() {
        String searchKey = 'App';

        Test.startTest();
        List<Account> result = AccountSearchController.searchAccounts(searchKey);
        Test.stopTest();

        Assert.areEqual(1, result.size(), 'ควรพบ 1 Account ที่มีคำว่า App');
        Assert.areEqual('Apple Inc', result[0].Name, 'ชื่อ Account ที่ค้นหาได้ไม่ถูกต้อง');
    }

    @isTest
    static void testSearchAccountsNotFound() {
        String searchKey = 'NonExistent';

        Test.startTest();
        List<Account> result = AccountSearchController.searchAccounts(searchKey);
        Test.stopTest();

        Assert.areEqual(0, result.size(), 'ไม่ควรพบข้อมูลใดๆ');
    }

    @isTest
    static void testSearchAccountsEmptyKey() {
        String searchKey = '';

        Test.startTest();
        List<Account> result = AccountSearchController.searchAccounts(searchKey);
        Test.stopTest();

        Assert.areEqual(3, result.size(), 'กรณีค่าว่างควรคืนค่าทั้งหมดที่ตรงตามเงื่อนไข');
    }
}