git diff --stat $GIT_COMMIT $GIT_PREVIOUS_COMMIT;
if [ $? == 0 ]; then
  echo "success"
else
  echo "failed"
fi
