# Solution

The current architecture is designed to model various types of card games, though its abstractions are somewhat constrained due to minimal requirements.

## Entities

All the classes that represent card game. All entities are covered by initial tests in `spec` folder. Run `bundle exec rspec` to verify they are green. 

**Deck**

`Deck` models generic deck of cards with common method such as `shuffle!`. An example of child class `FrenchDeck` is modelled after French-suited playing cards, specifically represent 52 deck cards. 

**Player**

Represent a single player, either human or computer. Each player is initialized with a name, empty hand and zero points. Points are accumulated based on game rule.

**Card**

Consist of a rank and a suit. Each card value is set in subclass of `GenericRule` which is explained below.

**GenericRule**

Generic game rule that is meant to be extended into specific game rule. Game rule needs to implement two methods:
- **#assign_card_values** : Assign point or value to each card in the deck based on game rule. For example, `Jack`, `Queen`, `King` are all worth 10 points in blackjack but in other game rule, they can be worth 11, 12 and 13 respectively.  
- **#deal_cards** : Deal a number of card to one or more players from provided deck.

## Things to consider 

1. Decide on what card game to implement, because it will dictate what platform is suitable and what delivery pipeline should look like.


2. Delivery pipeline: 
  
    Because the requirement is not clear about what game rule is as well as what platform to use ie online or offline game, there are a few possible scenarios to consider.

    - Offline: Runs the game locally, inside an infinite loop, no deployment needed

      ````
      loop do
        # Execute game here
      end
      ````

    - Online: More effort involves and likely requires tool such as capistrano to deploy the game to server. Next decision to make is whether the game needs websocket or simple http for communication.


## Final thoughts

There are so many card games and current structure cannot represent them all. All models are designed with extensibility in mind though. 