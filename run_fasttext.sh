FTDIR=$(pwd)/fastText/fastText-0.1.0
RESULTDIR=$(pwd)/scores
DATADIR=/local_madim/Desktop/ML_research

DIM=30
LR=0.1
WORDGRAMS=2
MINCOUNT=2
MINN=3
MAXN=3
BUCKET=1000000
EPOCH=20
THREAD=20

echo "DIM: $DIM - LR: $LR - (WGRAMS: $WORDGRAMS - MINC: $MINCOUNT) - CHARS ($MINN, $MAXN) - EPS: $EPOCH \n\n"

#$FTDIR/fasttext supervised -input "${DATADIR}/$1.train" -output "${RESULTDIR}/$1" -dim $DIM -lr $LR -wordNgrams $WORDGRAMS -minCount $MINCOUNT -minn $MINN -maxn $MAXN -bucket $BUCKET -epoch $EPOCH -thread $THREAD

#$FTDIR/fasttext supervised -input "/local_madim/Desktop/ML_research/query_gender.train" -output "${RESULTDIR}/$1" -dim $DIM -lr $LR -wordNgrams $WORDGRAMS -minCount $MINCOUNT -minn $MINN -maxn $MAXN -bucket $BUCKET -epoch $EPOCH -thread $THREAD

$FTDIR/fasttext supervised -input "/local_madim/Desktop/ML_research/data/query_gender_subset_train.txt" -output "${RESULTDIR}/$1" -test "/local_madim/Destop/ML_research/query_gender.test" -output "${RESULTDIR}/$1.bin" -dim $DIM -lr $LR -wordNgrams $WORDGRAMS -minCount $MINCOUNT -minn $MINN -maxn $MAXN -bucket $BUCKET -epoch $EPOCH -thread $THREAD

#$FTDIR/fasttext test "${RESULTDIR}/$1.bin" "${DATADIR}/$2.test"

$FTDIR/fasttext test "${RESULTDIR}/$1.bin" "/local_madim/Desktop/ML_research/query_gender.test"

$FTDIR/fasttext test "${RESULTDIR}/$1.bin" "/local_madim/Desktop/ML_research/manually_labeled_set.txt"
