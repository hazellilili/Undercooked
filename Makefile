ALL_DISHES := $(patsubst %/,%,$(filter-out .git/, $(wildcard */)))

ifeq (cook,$(firstword $(MAKECMDGOALS)))
  DISH_ARG := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(DISH_ARG):;@:)
endif

.PHONY: cook

cook:
	@if [ "$(DISH_ARG)" = "all" ]; then \
		echo "Ready? 这就给您报菜名儿："; \
		for dish in $(ALL_DISHES); do \
			echo "cooking $$dish..."; \
		done; \
	elif [ -z "$(DISH_ARG)" ]; then \
		echo "Craving sth? 想吃点啥？："; \
	elif [ -d "$(DISH_ARG)" ]; then \
		echo "cooking $(DISH_ARG)..."; \
	else \
		echo "Do not know how to cook '$(DISH_ARG)'. 不会做！自己点外卖！"; \
	fi
