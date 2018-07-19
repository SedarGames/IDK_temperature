#Find tmp.resultTemp
execute as @s store result score @s tmp.calTotalTemp run scoreboard players get @s tmp.calTotalTemp
execute as @s store result score @s tmp.resultTemp run scoreboard players operation @s tmp.calTotalTemp -= @s tmp.playerTemp

#Split everything for better performance
execute if score #tmp.bot_timer tmp.variable matches 39 as @s run function temperature:player/temperature
execute as @s if score #tmp.bot_timer_2 tmp.variable matches 20 if sccore @s tmp.resultTemp matches 15.. run function temperature:player/temperature
execute as @s if score #tmp.bot_timer_2 tmp.variable matches 20 if sccore @s tmp.resultTemp matches ..-15 run function temperature:player/temperature

#Reached Hot Tier 1
execute as @s[scores={tmp.playerTemp=75..85}] run function temperature:debuff/hot_tier_1

#Reached Hot Tier 2
execute as @s[scores={tmp.playerTemp=85..95}] run function temperature:debuff/hot_tier_2
