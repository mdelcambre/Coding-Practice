#!/usr/bin/env python

""" Provides the testing platform for the queuing library. """

from time import sleep

from asynch_queue import Queue


def print_state(message=None):
    print "---[%s]---" % (message)
    print "Is running: %s" % (q.isRunning())
    print "Size of the queue: %d" % (q.size())
    print "# Running: %d" % (q.inFlight())



def func_gen(delay):
    def func(callback):
        print "Start task #%s" %(delay)
        sleep(delay)
        print "Ending task #%s" %(delay)
        callback()
    return func

q = Queue(2)
print_state("Initialized Queue")


q.addTask(func_gen(10))
print_state("Added 1 task")
q.addTask(func_gen(2))
print_state("Added 2nd task")
q.addTask(func_gen(3))
print_state("Added 3rd task")
q.addTask(func_gen(4))
print_state("Added 4th task")
q.addTask(func_gen(5))
print_state("Added 5th task")
q.addTask(func_gen(6))
print_state("Added 6th task")

q.start()


def ending():
    raise Exception("ENDING CALLBACK")
q.addCallback(ending)
sleep(4)
q.addTask(ending)
q.addTask(func_gen(3))
while q.isRunning():
    print_state("Checking in")
    sleep(0.8)
