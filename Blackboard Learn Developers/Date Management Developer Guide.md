# Date Management Developer Guide
Date Management allows users with the role of instructor to easily update
content dates when they copy or restore a course from a previous term or
calendar year containing course content items with dates. Supported date types
include due dates, availability, and adaptive release dates related to the
course content. Date Management is accessed within the course from the Course
Tools panel. The tool collects setup data from the instructor, and executes
the process as a background job. The instructor is notified by email and
receipt message when date management completes. The instructor has the
opportunity to review the date changes once the task process completes. The
report page allows the instructor user to further modify the dates for one or
more content items.

The Date Management capabilities are available to building block developers.
Date Management APIs, which along with descriptions are available for review
on the [Date Management
APIs](https://community.blackboard.com/docs/DOC-2186-date-management-apis)
review page.

## Version Support

The Date Management Building Block is supported from Learn SP 12 and higher.
Date Management requires these mandatory building blocks to install and
execute:

  * Content Model building block version 1.2 (or higher)
  * Track Task Progress building block version 1.1 (or higher)
  * Common Styles building block version 1.0 (or higher)

##

##

## Implementation

Date Management leverages the existing content-model API implementation in the
Learn application. The tool process the content item dates as defined on the
content model. Each content type may have its own implementation. This means
for a course content type to transform dates, it must extend the content
model. Implementation for a specific course content needs to reside in the
respective building block. Content dates are not transformed if they are not
part of the content model.

Content model API supports the date rollover functionality based on the
content's content handle. Support is not based on the building block's handle.

##

##

## Implementation Scenarios

Date management depends on the content model implementation for transformation
of a specific content's dates. This page provides the most commonly used
scenarios and their implementation with examples.

The following examples use some of the common classes used in the
implementation.

Content model B2 contains the blackboard.platform.model.impl.LegacyContentMode

LegacyDateRolloverProvider provides the default implementation to transform
the availability dates and adaptive release dates. LegacyDateRolloverProvider
can be used in a content model class as a default implementation for a content
which support due dates, availability dates and adaptive release dates.

    @Override  
    public String getHandle()   {
          return _contentHandler.getHandle();  
    }  
    @Override  
    public String getName()   {    
        return _contentHandler.getName();  
    }

###

###

### DateRolloverControl

Content model building block contains the
blackboard.platform.model.control.DateRolloverControl objects instance which
contain the information course Id, date rollover task id and number of days to
process. This object is used to implement updateDates and updateDate methods
of the provider class.

    /* Log the date rollover summary record after update the entity date. This method used to log each date type update    * for an entity item.
     *   
     * @param entityHandle the Entity item handle.   
     * @param entityTitle the Entity item title.   
     * @param entityId string value of an Entity item id.   
     * @param dateType the Entity item date type.   
     * @param oldDate current date for the entity item date.   
     * @param newDate updated/transformed date for an entity item date.   
     * @param status status of the date log transformation {@link LogSummaryStatus}.   
     * @throws PersistenceException Database error   
     */  
     public void logDateChange(String entityHandle,
                               String entityTitle,
                               String entityId,
                               String dateType,                             
                               Calendar oldDate,
                               Calendar newDate,
                               LogSummaryStatus status )    
        throws PersistenceException;   
    /**   
     * This method used to transform the given date.   
     *   
     * @param oldDate current date for the entity item.   
     * @return Calendar updated date.   
     */  
     public Calendar transformDate( Calendar oldDate ); 
    /**   
     * The set of status that can be used to log the date transformation change.   
     */  
     @EnumValueMapping( values = { "S", "F", "E", "O" } )  
     public enum LogSummaryStatus   {     Success,     Failed,     Error,     Override   }

##

##

##

## Step by step content model implementation for specific content in B2

Date Management process do not consider the 3rd party B2 contents unless there
is a content model implementation specific to the content within the B2.
Following are the steps for implementation of content model and provider logic
to transform dates using date management. These are steps to follow with in
the content specific B2 for content model implementation.

Once implementation is done, date management process loads the specific model
and executes the logic provided in the provider class to transform dates.

  * In the content specific B2 - create model class

Model class can be extended LegacyContentModel or BaseContentModel

Example: TestModel or AnnouncementModel or DiscussionBoardModel from content
model API

  * If the course content supports default implementation then use LegacyDateRolloverProvider with in the constructor. LegacyDateRolloverProvider constructor takes content handle and array of date features supported by the content. Use this class in the constructor of the above created model class.
  * If the course content need specific implementation then create NEW provider by extending the LegacyDateRolloverProvider and use it in the constructor of the above created model class. New provider class takes content handle and array of date feature types. ( example : DiscussionBoardDateRolloverProvider from content model API )
  * NEW provider class created above need the specific implementation logic in the updateDates and updateDate methods.

The DateRolloverControl object is passed to these two methods via
BaseDateRolloverProvider class from the date management process. _No need to
initialize the DateRolloverControl object._

  * If the content item is gradable item then date management B2 transforms the due date for gradable items and sends notifications as well. It is not required to handle the gradable item due date for specific content in NEW provider class. Write logic to handle all other dates supported by the content except due dates.
  * Pseudo code to implement content specific logic in the updateDates method:
    * Load all the specific content for the course specified in the control object.
    * Loop through the each content and follow these steps:
    * Get each date supported by the specific content (example : start_date, end_date, etc).
    * Set default date rollover log summary value as: LogSummaryStatus.Success
    * Call control.transform method for each date and get updated date
      * Example:  

    Calendar updatedStartDate = control.transformDate( oldStartDate ); 
    Calendar updatedEndDate = control.transformDate( oldEndDate );

        * Update the content with the new transformed date values(s).
        * Persist the content. (which have updated transformed dates). Make use of LogSummaryStatus.Success for successful persistence.
        * If there is an exception while persisting then log the information and set LogSummaryStatus.Failed.
          * Example  

    LogServiceFactory.getInstance().logError( "Failed to update foo bar content start/end dates for  : " + title, e );
    summaryRowStatus = LogSummaryStatus.Failed;

        * For reporting purposes Date Management needs to log information to the summary table for each date transformed. This is required for successful/failed scenarios. For each date transformation make control.logDateChange of the control object.
      * Example :  

    if ( null != updatedStartDate ) {
        control.logDateChange( handle,
                               title,
                               entityId,
                               DateRolloverProviderHelper.START_DATE,
                               oldStartDate,
                               updatedStartDate,
                               summaryRowStatus )
     }       
    if ( null != updatedEndDate ) {          
        control.logDateChange( handle,
                             title,
                             entityId,
                             DateRolloverProviderHelper.END_DATE,
                             oldEndDate,
                             updatedEndDate,
                             summaryRowStatus );        
    }

If required for this specific content, make a call to the
registerContentUpdateNotification method implemented for this provider.

    * Pseudo code to implement content specific logic in the updateDate method.
      * This method handles the update one particular date provided to this method. It is not intended for updating gradable item due date. Update gradable item due date is handled by the date management B2.
      * Load the course content for the entity id provided to this 'updateDate' method. Course id provided in the control object.
      * Set default date rollover summary status as LogSummaryStatus.Override;
      * Set current content date for this date type in an oldDate variable for logging purpose.
      * Update the new date for the content based on the date type provided.
      * Persist the updated content.
      * If there is an exception while persisting then log the information and set LogSummaryStatus as following:  

    String msg = String.format( "Failed to update  foo bar %s date for %s", dateType, entityId );
    LogServiceFactory.getInstance().logError( msg, e ); 

    * Log the date rollover summary for successful/failed updates.
    * control.logDateChange( handle, title, entityId, DateRolloverProviderHelper.END_DATE, oldDate, newDate, summaryRowStatus );

If needed for this specific content make a call to the
registerContentUpdateNotification which implemented for this provider.

  * Pseudo code to implement content specific logic in the registerContentUpdateNotification method.
    * Not all course contents support content availability notification events. Please check with the current content whether it supports availability notification event or not. Ten use similar logic to send notification.
    * By default this method support null implementation.
    * Load course content for the entity id provided.
    * Set new availability dates provided to this content.
    * Make notification call for this content.

###

###

###

Scenario: How to invoke date management process outside the UI path i.e.
Course Tools -> Date Management?

Date Management can be invoked outside the UI path for a given course as
following:

    DateRolloverManager dateRolloverManager = (DateRolloverManager) ExtensionRegistryFactory.getInstance().getExtension( DateRolloverManager.EXTENSION_POINT );  
    DateRolloverTask dateRolloverTask = dateRolloverManager.processDateRollover( courseId, user.getId(), processDays, "" );  
    dateRolloverManager.updateTaskStatus(dateRolloverTask.getId(), DateRolloverTask.State.Complete);

###

###

###

### Scenario: Extending the content model implementation for a specific
content which support due date, availability/adaptive release dates and
adaptive release dates

Content model provides the LegacyContentModel class which can be extended to
transform the dates for this specific content. LegacyContentModel is a simple
base ContentModel implementation for legacy content types that have existing
an existing ContentModel defined. LegacyContentModel class extends
BaseContentModel.

The following code snippet provides details to extend the content model
implementation for a specific content which support due date,
availability/adaptive release dates and adaptive release dates:

    public class FooBarModel extends LegacyContentModel {
      public static final String HANDLE = "foo-bar";    
      public FooBarModel() {
        super( HANDLE, new Feature[] { Feature.DateRollover } );      
        _drProvider =
          new LegacyDateRolloverProvider( getHandle(), new DateFeature[] {
            DateFeature.DueDate, DateFeature.CADate, DateFeature.ARDate } );
      }    
      public DateRolloverProvider getDateRolloverProvider() {
        return _drProvider;    
      }
    }

###

###

### Scenario: For specific content which support due date,
availability/adaptive release dates and date roll process _NOT_ to transform
content dates during the process

Content model implementation for specific content can be used as part of date
management process and _NOT_ transform dates. These dates will not be
transformed, but they will be displayed as part of the transform report as
read only dates.

    public class FooBarReadOnlyModel extends LegacyContentModel {    
      public static final String HANDLE = "foo-bar-read-only";    
      public FooBarReadOnlyModel() {      
        super( HANDLE, new Feature[] { Feature.DateRollover } );      
       
        _drProvider =
          new FooBarReadOnlyModelDateRolloverProvider( getHandle(), new DateFeature[] { DateFeature.DueDateReadOnly, DateFeature.CADateReadOnly, DateFeature.ARDateReadOnly } );    
      }   
      
      public DateRolloverProvider getDateRolloverProvider() {
        return _drProvider;    
      }
    }
    public class FooBarReadOnlyModelDateRolloverProvider
      extends BaseDateRolloverProvider {
      public FooBarReadOnlyModelDateRolloverProvider( DateFeature[] dateFeatures ) {
        super( dateFeatures );  
      }
        
      @Override  
      public void updateDates( DateRolloverControl control )
        throws PersistenceException {
        //do not implement  
      }   
      @Override  
      public void updateDate( DateRolloverControl control, String entityId, String dateType, Calendar newDate )    
        throws PersistenceException, ValidationException {   
        //do not implement  
      }
    }

###

###

###

### Scenario: Extending content model implementation not to transform the
specific content due dates and transform other dates for the course content

For a specific content type that does not want to participate in rolling over
due dates. A use case for this example is if the availability dates are
managed by a third-party application/vendor. The Date rollover process will
NOT transform due dates during the process, HOWEVER will process availability
dates. _Please review the DateFeature enums for the other read-only types
supported._

    public class FooBarDueDateReadOnlyModel extends LegacyContentModel {
      public static final String HANDLE = "foo-bar-duedate-read-only";    
      public FooBarDueDateReadOnlyModel() {
        super( HANDLE, new Feature[] { Feature.DateRollover } );
        _drProvider = new LegacyDateRolloverProvider( getHandle(),new DateFeature[] { DateFeature.DueDateReadOnly, DateFeature.CADate } );    
      }    
      public DateRolloverProvider getDateRolloverProvider() {
        return _drProvider;    
      }
    }

###

###

###

### Scenario: Registering a notification event for content availability made
available through the date management job.

DateRolloverProvider supports registering course content notification events
when content is made available through the date management process via
registerContentUpdateNotification. This is applicable for content availability
notification events only.

    public class MyTempModel extends BaseContentModel {  
      public static final String HANDLE = "bb-my-temp";   
      private DateRolloverProvider _drProvider;   
      /**   
      * Constructor   
      */  
      public MyTempModel() {    
        super( new Feature[] { Feature.DateRollover } );    
        _drProvider = new MyTempDateRolloverProvider( new DateFeature[] { DateFeature.CADate } );  
      }
    }
    public class MyTempDateRolloverProvider extends BaseDateRolloverProvider {  
      public MyTempDateRolloverProvider( DateFeature[] dateFeatures ) {    
        super( dateFeatures );  
      }   
      @Override  
      public void updateDates( DateRolloverControl control )
        throws PersistenceException   {    
        // load the content data for the course provided in control object        
        // parse each content, get one date        
        // call control.transformDate (old date) which returns transformed NEW date.
        //   This is needed for EACH date to be updated/transformed..        
        // update the content with transformed date(s)        
        // persist content with updated new dates.         
        // call control.logDateChange( contentHANDLE, title, task.getId().toExternalString(),                                dateTyle, oldDueDate, updatedDueDate, summaryRowStatus );)
        // Call this method for EACH date transformed.         
        // call following notification method as necessary.    
      }   
      @Override  
      public void updateDate( DateRolloverControl control, String entityId, String dateType, Calendar newDate )    
        throws PersistenceException, ValidationException   {    
        // load content based on the provided entityId for the given course        
        // update the content date based on the newDate provide to this method.        
        // persist content         
        // call control.logDateChange( contentHANDLE, title, task.getId().toExternalString(),                                dateType, oldDueDate, updatedDueDate, summaryRowStatus );)         
        // call following notification method as necessary.  
      }   
      @Override  
      public void registerContentUpdateNotification( String entityId, Calendar startDate, Calendar endDate )    
        throws PersistenceException, ValidationException {    
        //do implementation  
      }
    }

###

###

###

### Logging

Date Management loads the content model classes implemented for course
contents and executes the provided class implementation logic. Logging used to
update the debug information is provided in the LEARN log files.

