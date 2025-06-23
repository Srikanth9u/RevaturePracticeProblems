class Solution(object):
    def combinationSum(self, candidates, target):
        """
        :type candidates: List[int]
        :type target: int
        :rtype: List[List[int]]
        """
        result = []
        def helper(remaining, ar, start):
            if remaining == 0:
                result.append(list(ar))
                return
            elif remaining < 0:
                return
            for i in range(start, len(candidates)):
                    ar.append(candidates[i])
                    helper(remaining - candidates[i], ar, i)
                    ar.pop()
                    
        helper(target,[],0)
        return result


        