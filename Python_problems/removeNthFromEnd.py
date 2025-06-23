# Definition for singly-linked list.
class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
class Solution(object):
    def removeNthFromEnd(self, head, n):
        """
        :type head: Optional[ListNode]
        :type n: int
        :rtype: Optional[ListNode]
        """
        ln = 0
        cr = head
        while cr:
            ln += 1
            cr = cr.next
        if ln == n:
            return head.next
        cr = head
        for _ in range(ln - n-1):
            cr = cr.next
        cr.next = cr.next.next
        return head
        