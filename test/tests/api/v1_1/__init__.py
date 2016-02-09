# import tests
from nodes_tests import NodesTests
from obm_tests import OBMTests
from amqp_tests import AMQPTests
from lookups_tests import LookupsTests
from profiles_tests import ProfilesTests
from config_tests import ConfigTests
from workflowTasks_tests import WorkflowTasksTests
from workflows_tests import WorkflowsTests

tests = [
    'nodes.tests',
    'obm.tests',
    'amqp.tests',
    'lookups.tests',
    'profiles.tests'
    'config.tests',
    'workflowTasks.tests',
    'workflows.tests'
]
