/**
 * @description Test class for AccountAutomations
 * @author BuildAgent
 * @date 2025-01-16
 */
@IsTest
private class AccountLogicTest {
    // Test data constants
    private static final String TEST_ACCOUNT_NAME = 'Test Account';
    private static final String DEFAULT_DESCRIPTION = 'Default description';
    private static final String CUSTOM_DESCRIPTION = 'Custom Description';
    private static final String DEFAULT_STREET = 'Basauri, 6';
    private static final String DEFAULT_STATE = 'Madrid';
    private static final String DEFAULT_POSTAL_CODE = '28023';
    private static final String DEFAULT_PHONE = '688456789';
    private static final String DEFAULT_WEBSITE = 'www.copa.do';
    
    /**
     * @description Test setup method to create test data
     */
    @TestSetup
    static void setupTestData() {
        // Create test account
        Account testAccount = new Account(Name = TEST_ACCOUNT_NAME);
        insert testAccount;
    }
    
    /**
     * @description Tests default description setting when description is null
     */
    @IsTest
    static void testSetDefaultDescriptionWhenNull() {
        // Given
        Account testAccount = new Account(Name = TEST_ACCOUNT_NAME);
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultDescription(testAccount);
        Test.stopTest();
        
        // Then
        System.assertEquals(DEFAULT_DESCRIPTION, resultAccount.Description, 
            'Description should be set to default value when null');
    }
    
    /**
     * @description Tests description remains unchanged when already set
     */
    @IsTest
    static void testSetDefaultDescriptionWhenNotNull() {
        // Given
        Account testAccount = new Account(
            Name = TEST_ACCOUNT_NAME,
            Description = CUSTOM_DESCRIPTION
        );
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultDescription(testAccount);
        Test.stopTest();
        
        // Then
        System.assertEquals(CUSTOM_DESCRIPTION, resultAccount.Description, 
            'Description should remain unchanged when already set');
    }
    
    /**
     * @description Tests setting default billing address
     */
    @IsTest
    static void testSetDefaultBillingAddress() {
        // Given
        Account testAccount = new Account(Name = TEST_ACCOUNT_NAME);
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultBillingAddress(testAccount);
        Test.stopTest();
        
        // Then
        System.assertEquals(DEFAULT_STREET, resultAccount.BillingStreet, 
            'Billing street should be set to default value');
        System.assertEquals(DEFAULT_STATE, resultAccount.BillingState, 
            'Billing state should be set to default value');
        System.assertEquals(DEFAULT_POSTAL_CODE, resultAccount.BillingPostalCode, 
            'Billing postal code should be set to default value');
    }
    
    /**
     * @description Tests setting default shipping address
     */
    @IsTest
    static void testSetDefaultShippingAddress() {
        // Given
        Account testAccount = new Account(Name = TEST_ACCOUNT_NAME);
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultShippingAddress(testAccount);
        Test.stopTest();
        
        // Then
        System.assertEquals(DEFAULT_STREET, resultAccount.ShippingStreet, 
            'Shipping street should be set to default value');
        System.assertEquals(DEFAULT_STATE, resultAccount.ShippingState, 
            'Shipping state should be set to default value');
        System.assertEquals(DEFAULT_POSTAL_CODE, resultAccount.ShippingPostalCode, 
            'Shipping postal code should be set to default value');
    }
    
    /**
     * @description Tests setting default phone number
     */
    @IsTest
    static void testSetDefaultPhone() {
        // Given
        Account testAccount = new Account(Name = TEST_ACCOUNT_NAME);
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultPhone(testAccount);
        Test.stopTest();
        
        // Then
        System.assertEquals(DEFAULT_PHONE, resultAccount.Phone, 
            'Phone should be set to default value');
    }
    
    /**
     * @description Tests setting default website URL
     */
    @IsTest
    static void testSetDefaultURL() {
        // Given
        Account testAccount = new Account(Name = TEST_ACCOUNT_NAME);
        
        // When
        Test.startTest();
        Account resultAccount = AccountLogic.setDefaultURL(testAccount);
        Test.stopTest();
        
        // Then
        System.assertEquals(DEFAULT_WEBSITE, resultAccount.Website, 
            'Website should be set to default value');
    }
    
    /**
     * @description Tests handling of null account parameter
     */
    @IsTest
    static void testNullAccountParameter() {
        // Given
        Account nullAccount = null;
        
        // When/Then
        Test.startTest();
        try {
            AccountLogic.setDefaultDescription(nullAccount);
            System.assert(false, 'Should throw exception for null account');
        } catch(IllegalArgumentException ex) {
            System.assertEquals('Account parameter cannot be null', ex.getMessage(), 
                'Should throw correct exception message');
        }
        Test.stopTest();
    }
}