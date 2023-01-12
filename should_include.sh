#!/bin/bash

#######################################
# Determines wether a function prototype
# requires stddef
# Arguments:
# 	Function to check
# Returns:
# 	1 if function requires stddef, 0 otherzise
#######################################
should_include_stddef()
{
	local prototype=$1
	if [[ $prototype == *"size_t"* ]]; then
		return 1
	else
		return 0
	fi
}

#######################################
# Determines wether a function prototype
# requires stdbool
# Arguments:
# 	Function to check
# Returns:
# 	1 if function requires stdbool, 0 otherzise
#######################################
should_include_stdbool()
{
	local prototype=$1
	if [[ $prototype == *"bool"* ]]; then
		return 1
	else
		return 0
	fi
}

#######################################
# Determines wether a function prototype
# requires stdarg
# Arguments:
# 	Function to check
# Returns:
# 	1 if function requires stdarg, 0 otherzise
#######################################
should_include_stdarg()
{
	local prototype=$1
	if [[ $prototype == *"va_list"* ]]; then
		return 1
	else
		return 0
	fi
}

declare -a flags_stdint=(
	"int8_t"
	"int16_t"
	"int32_t"
	"int64_t"
	"uint8_t"
	"uint16_t"
	"uint32_t"
	"uint64_t"
	"int_least8_t"
	"int_least16_t"
	"int_least32_t"
	"int_least64_t"
	"uint_least8_t"
	"uint_least16_t"
	"uint_least32_t"
	"uint_least64_t"
	"int_fast_8t"
	"int_fast_16t"
	"int_fast_32t"
	"int_fast_64t"
	"uint_fast_8t"
	"uint_fast_16t"
	"uint_fast_32t"
	"uint_fast_64t"
	"intptr_t"
	"intmax_t"
	"uintptr_t"
	"uintmax_t"
)

#######################################
# Determines wether a function prototype
# requires stdint
# Arguments:
# 	Function to check
# Returns:
# 	1 if function requires stdint, 0 otherzise
#######################################
should_include_stdint()
{
	local prototype=$1
	for typedef in ${flags_stdint[@]}; do
		if [[ $prototype == *"$typedef"* ]]; then
			return 1
		fi
	done
	return 0
}
