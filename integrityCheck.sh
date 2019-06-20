if [ -z ${1} ]; then
	echo "Usage: ./integrityCheck.sh [card-name] [transaction-id] [organization]"
    echo ""
	echo "Example: ./integrityCheck.sh alice transactionidfromalicexxxx Jatim"
	echo ""

	exit 1
fi

USERNAME=$1
TXID=$2
ORGANIZATION=$3

composer transaction submit -c $USERNAME@evote-network -d '{"$class":"org.evote.pemilihan.Check","transactionId":"${TXID}"}'

docker logs peer0.$ORGANIZATION.evote.com