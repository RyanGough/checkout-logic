#!/bin/bash

# create the checkout workspace in logicblox
lb create checkout

# add the checkout logic to the workspace
lb addblock checkout -f checkout.logic

# setup the prices of the items
lb exec checkout '+price["A"] = 50, +price["B"] = 30, +price["C"] = 20, +price["D"] = 15.'

# setup the specials
lb exec checkout '+specials["A", 3] = 130, +specials["B", 2] = 45.'

# create a basket
lb exec checkout '+basket(b), +basket_id(b:1).'

# scan some of the basket items
lb exec checkout '+scan(basket, "A") <- basket_id(basket:1).'
lb exec checkout '+scan(basket, "B") <- basket_id(basket:1).'
lb exec checkout '+scan(basket, "A") <- basket_id(basket:1).'
lb exec checkout '+scan(basket, "A") <- basket_id(basket:1).'
lb exec checkout '+scan(basket, "A") <- basket_id(basket:1).'
lb exec checkout '+scan(basket, "A") <- basket_id(basket:1).'
lb exec checkout '+scan(basket, "A") <- basket_id(basket:1).'
lb exec checkout '+scan(basket, "B") <- basket_id(basket:1).'
lb exec checkout '+scan(basket, "B") <- basket_id(basket:1).'

# show the cost of the basket
lb query checkout '_[] = cost <- basket_cost[basket] = cost, basket_id(basket:1).'

# delete the workspace
lb delete checkout

