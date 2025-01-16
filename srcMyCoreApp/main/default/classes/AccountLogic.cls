/**
 * @description Account automation class to handle default value settings for Account fields
 * @author BuildAgent
 * @date 2025-01-16
 */
public with sharing class AccountLogic {
    // Constants to store default values
    private static final String DEFAULT_DESCRIPTION = 'Default description';
    private static final String DEFAULT_STREET = 'Basauri, 6';
    private static final String DEFAULT_STATE = 'Madrid';
    private static final String DEFAULT_POSTAL_CODE = '28023';
    private static final String DEFAULT_PHONE = '688456789';
    private static final String DEFAULT_WEBSITE = 'www.copa.do';
    
    /**
     * @description Sets default description if not already set
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultDescription(Account account) {
        if (account == null) {
            throw new IllegalArgumentException('Account parameter cannot be null');
        }
        
        if (String.isBlank(account.Description)) {
            account.Description = DEFAULT_DESCRIPTION;
        }
        return account;
    }
    
    /**
     * @description Sets default billing address fields
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultBillingAddress(Account account) {
        if (account == null) {
            throw new IllegalArgumentException('Account parameter cannot be null');
        }
        
        account.BillingStreet = DEFAULT_STREET;
        account.BillingState = DEFAULT_STATE;
        account.BillingPostalCode = DEFAULT_POSTAL_CODE;
        return account;
    }
    
    /**
     * @description Sets default shipping address fields
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultShippingAddress(Account account) {
        if (account == null) {
            throw new IllegalArgumentException('Account parameter cannot be null');
        }
        
        account.ShippingStreet = DEFAULT_STREET;
        account.ShippingState = DEFAULT_STATE;
        account.ShippingPostalCode = DEFAULT_POSTAL_CODE;
        return account;
    }
    
    /**
     * @description Sets default phone number
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultPhone(Account account) {
        if (account == null) {
            throw new IllegalArgumentException('Account parameter cannot be null');
        }
        
        account.Phone = DEFAULT_PHONE;
        return account;
    }
    
    /**
     * @description Sets default website URL
     * @param account Account record to process
     * @return Account Updated account record
     */
    public static Account setDefaultURL(Account account) {
        if (account == null) {
            throw new IllegalArgumentException('Account parameter cannot be null');
        }
        
        account.Website = DEFAULT_WEBSITE;
        return account;
    }
}