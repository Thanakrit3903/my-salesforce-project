public with sharing class SampleService {
    public static String getGreeting() {
        return 'Hello from CI/CD';
    }
}
// End of file
// This class defines a simple service with a static method getGreeting that returns a greeting message. The method is designed to be called without instantiating the class, making it easy to use in various contexts within the Salesforce application.
// The getGreeting method can be used to demonstrate the functionality of a CI/CD pipeline by providing a consistent output that can be verified through automated tests, such as the SampleServiceTest class.