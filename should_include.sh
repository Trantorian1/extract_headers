# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    should_include.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: emcnab <marvin@42.fr>                      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/11 17:19:40 by emcnab            #+#    #+#              #
#    Updated: 2023/01/11 17:21:31 by emcnab           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

should_include_stddef()
{
	$prototype=$1
	return $prototype == *"size_t"*
}

should_include_stdbool()
{
	prototype=$1
	return $prototype == *"bool"*
}

should_include_stdarg()
{
	prototype=$1
	return $prototype == *"va_list"*
}

declare -a flags_stdint=(
	[int8_t]
	[int16_t]
	[int32_t]
	[int64_t]
	[uint8_t]
	[uint16_t]
	[uint32_t]
	[uint64_t]
	[int_least8_t]
	[int_least16_t]
	[int_least32_t]
	[int_least64_t]
	[uint_least8_t]
	[uint_least16_t]
	[uint_least32_t]
	[uint_least64_t]
	[int_fast_8t]
	[int_fast_16t]
	[int_fast_32t]
	[int_fast_64t]
	[uint_fast_8t]
	[uint_fast_16t]
	[uint_fast_32t]
	[uint_fast_64t]
	[intptr_t]
	[intmax_t]
	[uintptr_t]
	[uintmax_t]
)

should_include_stdint()
{
	prototype=$1
	for typedef in $flags_stdint; do
		if [[ $prototype == *"$typedef"* ]]; then
			return 1
		fi
	done
	return 0
}
