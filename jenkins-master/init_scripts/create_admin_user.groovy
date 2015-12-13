// Thanks https://gist.github.com/hayderimran7/50cb1244cc1e856873a4
import jenkins.model.*
import hudson.security.*

def instance = Jenkins.getInstance()

def adminUserName = System.getenv("ADMIN_USERNAME")
def adminPassword = System.getenv("ADMIN_PASSWORD")

assert adminUserName != null : "No ADMIN_USERNAME env var provided, but required"
assert adminPassword != null : "No ADMIN_PASSWORD env var provided, but required"

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
// FIXME : just during debugging/initial dev, remove the password part of that log
println "XXXXXXXXXXXXXXXXXX Creating the '$adminUserName' admin user with password '$adminPassword'"
hudsonRealm.createAccount("admin", System.getenv("ADMIN_PASSWORD"))
instance.setSecurityRealm(hudsonRealm)

def strategy = new GlobalMatrixAuthorizationStrategy()
strategy.add(Jenkins.ADMINISTER, "admin")

strategy.add(Jenkins.READ, "Anonymous")
instance.setAuthorizationStrategy(strategy)

instance.save()
