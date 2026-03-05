@isTest
private class ClassOneTest {
    @isTest static void testWork() {
        ClassOne.doWork();
        System.assert(true);
    }
}