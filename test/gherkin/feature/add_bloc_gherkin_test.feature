Feature: Calculator with Background
  Tests the addition feature of the calculator

  Scenario Outline: Test the AddBloc with multiple values
    Given I mock AdderInterface with the number <number>
    When I call the <event> <times> times
    Then I expect the result to be <outcome>

    Examples:
      | number | event            | times | outcome |
      | 1      | "AddNumber"      | 1     | 1       |
      | 1      | "AddNumber"      | 2     | 2       |
      | 1      | "AddNumber"      | 3     | 3       |
      | 2      | "AddNumber"      | 1     | 2       |
      | 2      | "AddNumber"      | 2     | 4       |
      | 2      | "AddNumber"      | 3     | 6       |
      | 3      | "AddNumber"      | 1     | 3       |
      | 3      | "AddNumber"      | 2     | 6       |
      | 3      | "AddNumber"      | 3     | 9       |
      | 1      | "SubtractNumber" | 1     | -1      |
      | 1      | "SubtractNumber" | 2     | -2      |
      | 1      | "SubtractNumber" | 3     | -3      |
      | 2      | "SubtractNumber" | 1     | -2      |
      | 2      | "SubtractNumber" | 2     | -4      |
      | 2      | "SubtractNumber" | 3     | -6      |
      | 3      | "SubtractNumber" | 1     | -3      |
      | 3      | "SubtractNumber" | 2     | -6      |
      | 3      | "SubtractNumber" | 3     | -9      |
