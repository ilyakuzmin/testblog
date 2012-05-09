Feature: Sign up using email and password
  In order to register in the system
  As a guest
  I want to register a new account using email and password

  Background:
    Given I am on the sign up page

  Scenario: User sign up using email and password
    When I submit registation form with email: "user01@example.com", password: "123456"
    Then an user should exist with email: "user01@example.com"
    And I should see notice about successful sign up

  Scenario: User tries to sign up with invalid email and short password
    When I submit registation form with email: "invalid email", password: "1234"
    Then an user should not exist with email: "invalid email"
    And I should see error notice about invalid email and password
