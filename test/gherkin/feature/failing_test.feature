Feature: Calculator with Background
  Tests the addition feature of the calculator

  @fail
  Scenario Outline: Test the AddBloc with multiple values
    Given I mock AdderInterface with the number <number>
    When I call the <event> <times> times
    Then I expect the result to be <outcome>

    Examples:
      | number | event       | times | outcome |
      | 1      | "AddNumber" | 1     | 0       |
