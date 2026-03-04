@IsTest
private class SampleServiceTest {
    @IsTest
    static void testGetGreeting() {
        System.assertEquals('Hello from CI/CD', SampleService.getGreeting());
    }
}
// End of file
// This test class verifies that the getGreeting method of the SampleService class returns the expected string.