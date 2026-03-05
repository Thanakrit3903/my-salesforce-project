@isTest
private class ClassTwoTest {
    @isTest static void testAdd() {
        Integer result = ClassTwo.add(10, 20);
        Assert.areEqual(30, result);
    }
}