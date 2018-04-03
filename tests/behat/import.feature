qtype @qtype_ddmatch
Feature: Test importing Drag and drop matching questions
  As a teacher
  In order to reuse Drag and drop matching questions
  I need to import them

  Background:
    Given the following "users" exist:
      | username | firstname | lastname | email                |
      | teacher1 | T1        | Teacher1 | teacher1@example.com |
    And the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |
    And the following "course enrolments" exist:
      | user     | course | role           |
      | teacher1 | C1     | editingteacher |
    And I log in as "teacher1"
    And I am on "Course 1" course homepage

  @javascript @_file_upload
  Scenario: import Drag and drop matching question.
    When I navigate to "Import" node in "Course administration > Question bank"
    And I set the field "id_format_xml" to "1"
    And I upload "question/type/ddmatch/tests/fixtures/qtype_sample_ddmatch.xml" file to "Import" filemanager
    And I press "id_submitbutton"
    Then I should see "Parsing questions from import file."
    And I should see "Importing 1 questions from file"
    And I should see "1. Classify the animals."
    And I press "Continue"
    And I should see "ddmatching-001"
