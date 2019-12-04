# Date Management APIs
*Author: Scott Hurrey*
*Categories: ['Building Blocks']*
*Tags: ['blackboard learn', 'api', 'date management', 'extension points', 'datemanagement', 'developer']*
---
## DateRolloverManager

Date Rollover Manager provides the methods to run a date rollover background
job and update the background job status. The Date rollover background job
method takes course, user, and number of days, to process information and
returns the date rollover task object. The background job loads the content
related to the course and transforms the availability, adaptive release, and
due dates based on the number of days information provided. Date rollover
transformation depends on the content model implementation for a particular
content object within the course.

processDateRollover method can be invoked based on system admin, course
instructor and course build roles.

    DateRolloverTask processDateRollover( blackboard.persist.Id courseId,
                                          blackboard.persist.Id userId,
                                          int numDays,
                                          java.lang.String taskIdentifier )
        throws blackboard.platform.messagequeue.MessageQueueException,
               blackboard.persist.PersistenceException,
               blackboard.platform.security.authentication.BbSecurityException

Process date rollover as background job for a given course and user
information.

**Parameters:**  
courseId - Id of the course object for date rollover.

userId - Id of the user object for date rollover.

numDays - The number of days to add/subtract to the current date.

Supports positive and negative number of days.

taskIdentifier - Identifier of the task to display task tracking status.

Could be empty string value.

**Returns:**  
DateRolloverTask - date rollover task record

**Throws:**  
blackboard.platform.security.authentication.BbSecurityException - Security
error

blackboard.persist.PersistenceException - Database error

blackboard.platform.messagequeue.MessageQueueException - Message Queue error.

    void updateTaskStatus( blackboard.persist.Id taskId,                    
                           DateRolloverTask.State state )                      
        throws blackboard.platform.security.authentication.BbSecurityException,
               blackboard.persist.PersistenceException,
               blackboard.platform.messagequeue.MessageQueueException

Method to update date rollover background job status value.

**Parameters:**  
taskId - Id of the DateRolloverTask object.

state - DateRolloverTask.State of the date rollover task record.

**Throws:**  
blackboard.platform.security.authentication.BbSecurityException - Security
error

blackboard.persist.PersistenceException - Database error

blackboard.platform.messagequeue.MessageQueueException - Message Queue error.

###

## DateRolloverProvider

DateRolloverProvider provides methods supporting course content date
transformation as supported by the content item. It transforms a single date
type using the content model implementation. Additionally,
DateRolloverProvider provides support for content model editable/read-only
date feature. DateRolloverProvider also provides support for registering
content availability notification.

The following API calls may be used as part of content model implementation
which is specific to date management functionality. They cannot be used other
purpose.

    void updateDates( DateRolloverControl control )
        throws blackboard.persist.PersistenceException

Transform the date(s) supported by particular entity item using content model
implementation.

**Parameters:**  
control - DateRolloverControl object.

**Throws: **

blackboard.persist.PersistenceException - Database error.

    void updateDate( DateRolloverControl control,
                     java.lang.String entityId,              
                     java.lang.String dateType,              
                     java.util.Calendar newDate )                
        throws blackboard.persist.PersistenceException,
               blackboard.data.ValidationException

Transform single date supported by particular entity item using content model
implementation. This method is used to process single date type as supported
by entity item.

**Parameters:**  
control - DateRolloverControl object.

entityId - String value of the Id of the content object.

dateType - String value of the date type.

DateRolloverProviderHelper.START_DATE,

DateRolloverProviderHelper.END_DATE,

DateRolloverProviderHelper.DUE_DATE,

DateRolloverProviderHelper.AR_START_DATE

DateRolloverProviderHelper.AR_END_DATE

newDate - Calendar value of the date value to be persisted.

**Throws:**  
blackboard.persist.PersistenceException - Database error.

blackboard.data.ValidationException - validation error.

    boolean supportsDateFeature( DateRolloverProvider.DateFeature dateFeature )

Indicates whether the DateRolloverProvider support object is associated with
supports a particular date feature. If it does support a particular returns
true. Otherwise return false.

**Parameters: **

dateFeature - DateRolloverProvider.DateFeature object.

**Returns: **

boolean - true/false value.

    void registerContentUpdateNotification(java.lang.String entityId,                                     
                                           java.util.Calendar startDate,                                                  
                                           java.util.Calendar endDate)                                       
        throws blackboard.persist.PersistenceException,                                             
               blackboard.data.ValidationException

This method update the registered notification event for the content
availability.

**Parameters:**  
entityId - String value of the Id of the content object.

startDate - Calendar value of the start date of the content item.

endDate - Calendar value of the start date of the content item.

**Throws:**

blackboard.persist.PersistenceException - Database error.

blackboard.data.ValidationException - validation error.

    public enum DateFeature {
      // This date type supports content adaptive release dates which can be edited.  
         ARDate,   
      // This date type supports content adaptive release dates which are read only.
         ARDateReadOnly,   
      // This date type supports content availability dates which can be edited.   
         CADate,   
      // This date type supports content availability dates which are read only.   
         CADateReadOnly,   
      // This date type supports gradable item due date which can be edited.   
         DueDate,   
      // This date type supports gradable item due date which are read only.   
         DueDateReadOnly 
    }

The set of features that can be used to check date type.

Notification method registerContentUpdateNotification(...) can be used to
support content availability dates notification. It not intended to support
gradable item due date, past due date transformation notifications during the
date rollover functionality. By default gradable item due date and past due
date transformation notifications are handled by date rollover functionality
if the gradable item due date is NOT read only i.e model supports 'DueDate'.

## BaseDateRolloverProvider

      @Override  
      public void registerContentUpdateNotification( String entityId,
                                                     Calendar startDate,
                                                     Calendar endDate )    
          throws PersistenceException, ValidationException   {  
          // implementation here
      }

Base implementation class which provides an empty implementation for
registerContentUpdateNotification method.

**Parameters:**  
entityId - String value of the Id of the content object.

startDate - Calendar value of the start date of the content item.

endDate - Calendar value of the start date of the content item.

**Throws:**  
blackboard.persist.PersistenceException - Database error.

blackboard.data.ValidationException - validation error.

