import jenkins.model.*

def instance = Jenkins.getInstance()

// Only one, basically mainly to run admin/housekeeping task.
// Issue: prevent other jobs to run here
instance.setNumExecutors(1)

instance.save()
