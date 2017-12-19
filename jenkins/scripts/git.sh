git diff --stat --exit-code $GIT_COMMIT $GIT_PREVIOUS_COMMIT -- app/config.js;
if [ $? == 0 ]; then
  echo "success"
else
  echo "failed"
fi
