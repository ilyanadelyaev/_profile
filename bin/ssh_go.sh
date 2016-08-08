#!/usr/bin/env bash

MY=(
    'nadelyaev.dev.crm.rambler-co.ru'
    'nadelyaev.dev.crm.rambler.ru'
)

DEV=(
    'api.dev.crm.rambler-co.ru'
    'queue.dev.crm.rambler-co.ru'
    'dev.crm.rambler-co.ru'
    'subscriptions.dev.crm.rambler.ru'
    'storage.dev.crm.rambler-co.ru'
    'db.dev.crm.rambler-co.ru'
    'cache.dev.crm.rambler-co.ru'
    'stat.dev.crm.rambler-co.ru'
)

STAGE=(
    'api.stage.crm.rambler-co.ru'
    'queue.stage.crm.rambler-co.ru'
    'stage.crm.rambler-co.ru'
    'subscriptions.stage.crm.rambler.ru'
    'storage.stage.crm.rambler-co.ru'
    'db.stage.crm.rambler-co.ru'
    'cache.stage.crm.rambler-co.ru'
)

PROD=(
    'api.crm.rambler-co.ru'
    'queue.crm.rambler-co.ru'
    'crm.rambler-co.ru'
    'subscriptions.crm.rambler.ru'
    'storage.crm.rambler-co.ru'
    'db.crm.rambler-co.ru'
    'cache.crm.rambler-co.ru'
    'stat.crm.rambler-co.ru'
)

QA=(
    'api.qa.crm.rambler-co.ru'
    'queue.qa.crm.rambler-co.ru'
    'qa.crm.rambler-co.ru'
    'subscriptions.qa.crm.rambler.ru'
    'storage.qa.crm.rambler-co.ru'
    'db.qa.crm.rambler-co.ru'
    'cache.qa.crm.rambler-co.ru'
    'stat.qa.crm.rambler-co.ru'
)

MISC=(
    'mailer.dev.crm.rambler-co.ru'
)


if [ -z "$1" ]; then

    echo '- MY -'
    for i in ${!MY[*]}
    do
        printf "%d: %s\n" $i ${MY[$i]}
    done

    echo '- DEV -'
    for i in ${!DEV[*]}
    do
        printf "1%d: %s\n" $i ${DEV[$i]}
    done

    echo '- STAGE -'
    for i in ${!STAGE[*]}
    do
        printf "2%d: %s\n" $i ${STAGE[$i]}
    done

    echo '- PROD -'
    for i in ${!PROD[*]}
    do
        printf "3%d: %s\n" $i ${PROD[$i]}
    done

    echo '- QA -'
    for i in ${!QA[*]}
    do
        printf "4%d: %s\n" $i ${QA[$i]}
    done

    echo '-- MISC --'
    for i in ${!MISC[*]}
    do
        printf "5%d: %s\n" $i ${MISC[$i]}
    done

    echo 'CHOICE [with ENTER]:'
    read choice

else

    choice=$1

fi


# MY
if (( $choice >= 0 && $choice <= 9 )); then
    ((choice = choice))
    server=${MY[${choice}]}
fi

# DEV
if (( $choice >= 10 && $choice <= 19 )); then
    ((choice = choice - 10))
    server=${DEV[${choice}]}
fi

# STAGE
if (( $choice >= 20 && $choice <= 29 )); then
    ((choice = choice - 20))
    server=${STAGE[${choice}]}
fi

# PROD
if (( $choice >= 30 && $choice <= 39 )); then
    ((choice = choice - 30))
    sever=${PROD[${choice}]}
fi

# QA
if (( $choice >= 40 && $choice <= 49 )); then
    ((choice = choice - 40))
    server=${QA[${choice}]}
fi

# MISC
if (( $choice >= 50 && $choice <= 59 )); then
    ((choice = choice - 50))
    server=${MISC[${choice}]}
fi


# SSH

echo 'GO to' $server

ssh -A nadelyaev@${server}
